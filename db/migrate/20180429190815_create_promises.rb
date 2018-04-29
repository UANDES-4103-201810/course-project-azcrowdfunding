class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.string :title
      t.text :description
      t.datetime :edd
      t.integer :amount
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
