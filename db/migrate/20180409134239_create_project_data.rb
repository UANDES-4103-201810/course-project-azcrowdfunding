class CreateProjectData < ActiveRecord::Migration[5.1]
  def change
    create_table :project_data do |t|
      t.string :title
      t.string :description
      t.integer :goal
      t.integer :duration
      t.string :link_markdown
      t.timestamp :last_mod
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
