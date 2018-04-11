class User < ApplicationRecord
  has_many :projects
  has_one :personal_info
  has_one :credential
  has_many :favorites
  has_many :projects # => through(:favorites)
  has_many :contributions
  has_many :finances
  validate :date_notpast
  def date_notpast
    if self.last_login < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  accepts_nested_attributes_for :personal_info
end
