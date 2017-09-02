class AddAlertTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :alert_time, :datetime
  end
end
