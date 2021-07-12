FactoryBot.define do
  factory :order_address do
    postal_code   { "001-0000" }
    prefecture    { 29 }
    city          { "伊丹市梅ノ木" }
    address       { "4-1-21" }
    building_name { "" }
    phone_number  { "09012345678" }
  end
end
