class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :payments, through: :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice

  validates :item_id, :invoice_id, :quantity, :unit_price, presence: true
end
