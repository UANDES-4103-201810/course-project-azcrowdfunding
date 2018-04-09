class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.boolean :active
      t.boolean :visible
      t.timestamp :release_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
