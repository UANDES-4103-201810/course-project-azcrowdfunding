class CreateProjectCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :project_categories do |t|
      t.references :category, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
