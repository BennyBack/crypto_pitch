class RemovePhoneFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone, :integer
  end
end
