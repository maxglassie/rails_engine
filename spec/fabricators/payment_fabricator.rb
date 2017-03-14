Fabricator(:payment) do
  invoice
  credit_card_number
  credit_card_expiration_date
  result { %w(success failed).sample }
end
