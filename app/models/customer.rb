class Customer < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices
  has_many :merchants, through: :invoices
  has_many :items, through: :merchants


  validates :first_name, :last_name, presence: true

  def favorite_merchant
    merchants.joins(:payments).merge(Payment.success).group(:id).order("count(payments) desc").first
  end
end
