class CreateFinances < ActiveRecord::Migration[5.1]
  def change
    create_table :finances do |t|
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true

      t.timestamps
    end
  end
end
