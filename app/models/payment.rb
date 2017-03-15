class Payment < ApplicationRecord
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice
  has_many :invoice_items, through: :invoice
  has_many :items, through: :invoice_items

  validates :invoice_id, :credit_card_number, :result, presence: true

  scope :success, -> { where(result: 'success') }
end
