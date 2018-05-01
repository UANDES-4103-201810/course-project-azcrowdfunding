class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
