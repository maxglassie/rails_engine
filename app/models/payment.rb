class Payment < ApplicationRecord
  belongs_to :invoice

  validates :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, presence: true
end
