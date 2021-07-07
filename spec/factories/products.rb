FactoryBot.define do
  factory :product do
    product_name          { 'Test Product' }
    description           { 'Product description' }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_fee_id       { 2 }
    prefecture_id         { 2 }
    trading_status_id     { 2 }
    price                 { 1000 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
