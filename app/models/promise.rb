class Promise < ApplicationRecord
  belongs_to :project
  has_many :finances
  has_many :users, trough: :finance
  validates :amount, presence: true
  validates :description, presence: true
end
