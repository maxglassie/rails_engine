Fabricator(:payment) do
  invoice
  credit_card_number { Faker::Business.credit_card_number }
  credit_card_expiration_date { Faker::Date.between(2.days.ago, Date.today) }
  result { %w(success failed).sample }
end
