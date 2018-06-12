class AddConfirmTokenToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :confirm_token, :string
  end
end
