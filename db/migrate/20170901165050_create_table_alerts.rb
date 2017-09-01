class CreateTableAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
