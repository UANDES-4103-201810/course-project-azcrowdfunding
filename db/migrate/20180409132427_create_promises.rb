class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.integer :amount
      t.string :description
      t.timestamp :edd
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
