Fabricator(:payment) do
  invoice
  credit_card_number
  result { %w(success failed).sample }
end
