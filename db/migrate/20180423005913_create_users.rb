class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :admin
      t.string :address
      t.string :email
      t.string :country
      t.string :city
      t.string :username
      t.string :password
      t.string :security_question
      t.string :aswer

      t.timestamps
    end
  end
end
