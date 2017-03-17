Fabricator(:item) do
  name { Faker::Lorem.word }
  description "Sunshine and whiskey"
  unit_price "50.55"
  merchant
end
