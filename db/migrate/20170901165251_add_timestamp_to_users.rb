class AddTimestampToUsers < ActiveRecord::Migration[5.1]
  def self.down # Or `def up` in 3.1
    change_table :users do |t|
        t.timestamps
    end
end
end
