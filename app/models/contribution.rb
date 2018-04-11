class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :contribution, presence: true # shouldn't this be 'validates :amount, presence: true'?
  validate :date_not_past
  validates :amount, numericality: { greater_than: 0 }
  after_create :init

  def date_not_past
    if date < DateTime.now
      errors.add(:date, "can't be in the past")
    end
  end

  def init
    self.date = DateTime.now
  end

end
