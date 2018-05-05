class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", small: "80x80#", thumb: "30x30#" }, default_url: "generic_profile.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence:true, length: {minimum: 2}
  validates :phone, length: { is: 9 }
  validates :address, presence: true, length: { minimum: 4}
  validates :country, presence: true, length: {minimum: 3}
  validates :city, presence: true, length: {minimum: 3}
  has_many :projects
  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :project
  has_many :contributions
  has_many :projects_founded, through: :contributions, source: :project
  has_many :finance
  has_many :promises_bought, through: :finance, source: :promise

  def is_admin?
    self.admin
  end
end
