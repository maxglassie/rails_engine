Fabricator(:item) do
  name { Faker::Lorem.word }
  description "Sunshine and whiskey"
  unit_price { Faker::Number.number(5) }
  merchant
end
