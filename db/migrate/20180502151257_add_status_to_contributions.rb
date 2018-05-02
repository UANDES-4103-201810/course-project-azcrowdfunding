class AddStatusToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :status, :boolean
  end
end
