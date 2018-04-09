class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :amount
      t.timestamp :date

      t.timestamps
    end
  end
end
