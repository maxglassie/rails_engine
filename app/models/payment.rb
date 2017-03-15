class Payment < ApplicationRecord
  belongs_to :invoice
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :invoice_id, :credit_card_number, :result, presence: true

  scope :success, -> { where(result: 'success') }
end
