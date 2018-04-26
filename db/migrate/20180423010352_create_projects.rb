class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.integer :duration
      t.string :markdown
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
