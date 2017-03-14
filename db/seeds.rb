require 'csv'
require './app/models/customer.rb'
require './app/models/invoice_item.rb'
require './app/models/invoice.rb'
require './app/models/item.rb'
require './app/models/merchant.rb'
require './app/models/payment.rb'

CSV.foreach('db/data/customers.csv', :headers => true) do |row|
  Customer.create!({
    first_name: row["first_name"],
    last_name: row["last_name"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end

CSV.foreach('db/data/merchants.csv', :headers => true) do |row|
  Merchant.create!({
    name: row["name"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end

CSV.foreach('db/data/items.csv', :headers => true) do |row|
  Item.create!({
    name: row["name"],
    description: row["description"],
    unit_price: row["unit_price"],
    merchant_id: row["merchant_id"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end

CSV.foreach('db/data/invoices.csv', :headers => true) do |row|
  Invoice.create!({
    customer_id: row["customer_id"],
    merchant_id: row["merchant_id"],
    status: row["status"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end

CSV.foreach('db/data/invoice_items.csv', :headers => true) do |row|
  InvoiceItem.create!({
    item_id: row["item_id"],
    invoice_id: row["invoice_id"],
    quantity: row["quantity"],
    unit_price: row["unit_price"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end

CSV.foreach('db/data/transactions.csv', :headers => true) do |row|
  Payment.create!({
    invoice_id: row["invoice_id"],
    credit_card_number: row["credit_card_number"],
    credit_card_expiration_date: row["credit_card_expiration_date"],
    result: row["result"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]})
end
