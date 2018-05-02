class AddStatusToFinances < ActiveRecord::Migration[5.1]
  def change
    add_column :finances, :status, :boolean
  end
end
