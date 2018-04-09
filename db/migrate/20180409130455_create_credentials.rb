class CreateCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :credentials do |t|
      t.string :password
      t.string :username
      t.string :sec_q
      t.string :answer
      t.timestamp :last_mod
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
