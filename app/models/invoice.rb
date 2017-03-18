class Invoice < ApplicationRecord
  has_many :payments
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :customer_id, :merchant_id, :status, presence: true
end
