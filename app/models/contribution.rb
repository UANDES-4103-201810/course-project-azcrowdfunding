class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :contribution, presence: true
  validate :date_notpast
  def date_notpast
    if date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

end
