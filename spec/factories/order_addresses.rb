FactoryBot.define do
  factory :order_address do
    user_id       { 2 }
    product_id    { 1 }
    postal_code   { "001-0000" }
    prefecture_id { 2 }
    city          { "札幌市北区" }
    address       { "1-1-11" }
    building_name { "" }
    phone_number  { "09012345678" }

    token         { "4242424242424242" }
  end
end
