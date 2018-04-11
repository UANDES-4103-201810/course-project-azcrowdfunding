class Project < ApplicationRecord
  belongs_to :user # => throw(:favorites)
  has_many :favorites
  has_many :contributions
  has_many :promises
  has_one :project_datum
end
