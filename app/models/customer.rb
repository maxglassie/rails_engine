class Customer < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices

  validates :first_name, :last_name, presence: true
end
