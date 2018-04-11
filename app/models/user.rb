class User < ApplicationRecord
  has_many :projects
  has_one :personal_info
  has_one :credential
  has_many :favorites
  has_many :projects # => through(:favorites)
  has_many :contributions
  has_many :financings
  validate :date_notpast
  after_create :init
  def date_notpast
    if self.last_login < DateTime.now
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  accepts_nested_attributes_for :personal_info

  def init
    self.last_login = DateTime.now
  end
end
