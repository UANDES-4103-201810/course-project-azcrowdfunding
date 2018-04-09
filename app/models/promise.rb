class Promise < ApplicationRecord
  belongs_to :project
  has_many :finances
  validates :amount, presence: true
  validates :description, presence: true
end
