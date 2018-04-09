class Project < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :contributions
  has_many :promises
  has_one :project_data
end
