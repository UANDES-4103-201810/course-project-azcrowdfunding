class AddConfirmTokenToFinances < ActiveRecord::Migration[5.1]
  def change
    add_column :finances, :confirm_token, :string
  end
end
