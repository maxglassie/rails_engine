class UpdateDatetimeForPayments < ActiveRecord::Migration[5.0]
  def change
    change_column :payments, :created_at, :datetime, precision: 0
    change_column :payments, :updated_at, :datetime, precision: 0
  end
end
