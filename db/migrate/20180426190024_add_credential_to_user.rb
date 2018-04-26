class AddCredentialToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :credential_id, :integer
  end
end
