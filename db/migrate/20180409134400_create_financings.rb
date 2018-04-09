class CreateFinancings < ActiveRecord::Migration[5.1]
  def change
    create_table :financings do |t|
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true
      t.timestamp :date

      t.timestamps
    end
  end
end
