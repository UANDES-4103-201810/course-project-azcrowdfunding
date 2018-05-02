class ProjectCategory < ApplicationRecord
  belongs_to :category
  belongs_to :project
end
