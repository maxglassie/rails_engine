Fabricator(:invoice_item) do
  item
  invoice
  quantity{Faker::Number.number(1)}
  unit_price{Faker::Number.decimal(2)}
end
