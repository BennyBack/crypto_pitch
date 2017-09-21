class AddCryptoIdToAlerts < ActiveRecord::Migration[5.1]
  def change
    add_column :alerts, :crypto_id, :string
  end
end
