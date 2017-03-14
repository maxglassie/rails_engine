Fabricator(:item) do
  name { Faker::Lorem.word }
  description { Faker::ChuckNorris.fact }
  unit_price { Faker::Number.decimal(2) }
  merchant
end
