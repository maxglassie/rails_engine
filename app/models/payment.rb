class Payment < ApplicationRecord
  belongs_to :invoice

  validates :invoice_id, :credit_card_number, :result, presence: true
end
