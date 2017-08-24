class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.datetime :time
      t.string :currency
      t.integer :start_value
      t.float :min_new
      t.float :max_new
      t.integer :time_value
      t.string :time_interval
      t.datetime :alert_at

      t.timestamps
    end
  end
end
