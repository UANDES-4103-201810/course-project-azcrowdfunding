class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :active
      t.timestamp :last_login
      t.timestamps
    end
  end
end
