class Project < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :contributions
  has_many :users, through: :contributions
  has_many :promises
  has_one :project_datum
  has_many :users, through: :favorites
  validates :active, presence: true
  validates :visible, presence: true
  validate :release_date_not_past

  def relase_date_not_past
    if relase_date < DateTime.now
      errors.add(:date, "can't be in the past")
    end
  end
end
