class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_one :payment, through: :invoice

  validates :item_id, :invoice_id, :quantity, :unit_price, presence: true
end
