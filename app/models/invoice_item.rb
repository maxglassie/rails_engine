class InvoiceItem < ApplicationRecord
  has_many :items
  belongs_to :invoice
  has_many :invoice_items
  has_many :payments, through: :invoice_items

  validates :item_id, :invoice_id, :quantity, :unit_price, presence: true
end
