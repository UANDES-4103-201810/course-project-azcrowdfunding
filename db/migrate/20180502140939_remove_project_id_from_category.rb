class RemoveProjectIdFromCategory < ActiveRecord::Migration[5.1]
  def change
    remove_reference :categories, :project, foreign_key: true
  end
end
