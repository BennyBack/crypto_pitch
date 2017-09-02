class AddAlertParametersToAlerts < ActiveRecord::Migration[5.1]
  def change
    add_column :alerts, :currency, :string
    add_column :alerts, :currency_value, :string
    add_column :alerts, :min_new, :integer
    add_column :alerts, :max_new, :integer
    add_column :alerts, :time_value, :integer
    add_column :alerts, :time_interval, :string
  end
end
