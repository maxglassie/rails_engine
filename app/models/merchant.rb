class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items
  has_many :payments, through: :invoice_items

  validates :name, presence: true
end
