class UpdateDatetimeForInvoices < ActiveRecord::Migration[5.0]
  def change
    change_column :invoices, :created_at, :datetime, precision: 0
    change_column :invoices, :updated_at, :datetime, precision: 0
  end
end
