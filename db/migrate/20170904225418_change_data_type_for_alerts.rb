class ChangeDataTypeForAlerts < ActiveRecord::Migration[5.1]
  def change
    execute "ALTER TABLE alerts ALTER COLUMN currency_value TYPE decimal USING currency_value::numeric "
  end
end
