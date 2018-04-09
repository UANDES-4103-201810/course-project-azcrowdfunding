class CreatePersonalInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :admin
      t.string :address
      t.string :email
      t.string :country
      t.string :city
      t.timestamp :last_mod
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
