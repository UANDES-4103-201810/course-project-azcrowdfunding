class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]
  has_attached_file :avatar, styles: { medium: "300x300>", small: "80x80#", thumb: "30x30#" }, default_url: "generic_profile.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence:true, length: {minimum: 2}
  has_many :projects, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorite_projects, through: :favorites, source: :project
  has_many :contributions, :dependent => :destroy
  has_many :projects_founded, through: :contributions, source: :project
  has_many :finance, :dependent => :destroy
  has_many :promises_bought, through: :finance, source: :promise

  def is_admin?
    self.admin
  end

  def self.from_omniauth (auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def print
    puts self.uid
    puts self.provider
    puts self.first_name
    puts self.last_name
    puts self.email
    puts self.phone
    puts self.address
    puts self.country
    puts self.city
    puts self.password
  end
end
