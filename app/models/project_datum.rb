class ProjectDatum < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :description, precence: true
  validates :goal, precence: true
end
