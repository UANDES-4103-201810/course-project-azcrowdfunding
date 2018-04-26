class RemoveCredentialsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :credential_id, :string
  end
end
