class UpdateDatetimeForCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :created_at, :datetime, precision: 0
    change_column :customers, :updated_at, :datetime, precision: 0
  end
end
