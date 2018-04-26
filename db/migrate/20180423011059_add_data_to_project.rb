class AddDataToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :outstanding, :boolean
  end
end
