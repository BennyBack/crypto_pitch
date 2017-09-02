class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
      remove_column :alerts, :alert_time, :datetime
  end
end
