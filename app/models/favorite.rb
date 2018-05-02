class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :project

  ##
  # ##
  # # Association "A"
  #
  # # Find projects the current_user created
  # current_user.projects
  #
  # # Create project for current_user
  # current_user.projects.create!(...)
  #
  # # Load user that created a project
  # @project = Project.find(1)
  # @project.user
  #
  # ##
  # #  Association "B"
  #
  # # Find favorites for current_user
  # current_user.favorites
  #
  # # Find which users favorite @project
  # @project = Project.find(1)
  # @project.favorited_by # Retrieves users that have favorited this project
  #
  # # Add an existing project to current_user's favorites
  # @project = Project.find(1)
  # current_user.favorites << @project
  #
  # # Remove a project from current_user's favorites
  # @project = Project.find(1)
  # current_user.favorites.delete(@project)  # (Validate)
end
