class UpdateDatetimeForInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    change_column :invoice_items, :created_at, :datetime, precision: 0
    change_column :invoice_items, :updated_at, :datetime, precision: 0
  end
end
