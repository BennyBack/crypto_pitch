class AddAlertTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :alerts, :alert_time, :datetime
  end
end
