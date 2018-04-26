class User < ApplicationRecord
  belongs_to :credential
  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence:true, length: {minimum: 2}
  validates :phone, length: { is: 9 }
  validates :address, presence: true, length: { minimum: 4}
  validates :country, presence: true, length: {minimum: 3}
  validates :city, presence: true, length: {minimum: 3}
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :username, length: { maximum: 25 }
  validate :check_profile
  has_many :favorites
  has_many :projects
  has_many :projects, through: :favorites
  has_many :contributions
  has_many :projects, through: :contributions
  has_many :finance
  has_many :promises, through: :finance


  def check_profile
    if self.credential.users.count > 0
      errors.add(:credential_id, "can't have more than one profile")
    end
  end
end
