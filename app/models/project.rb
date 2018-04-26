class Project < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :contributions
  has_many :users, through: :contributions
  has_many :promises
  has_many :users, through: :favorites
  validates :title, presence: true
  validates :description, presence: true
  validates :goal, presence: true
  validates :duration, presence: true
  validates :goal, numericality: { greater_than: 0 }
end
