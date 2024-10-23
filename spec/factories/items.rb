FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    exp { Faker::Lorem.sentence }
    category_id { 2 } # ActiveHashのデフォルト値がある場合にそれを使う
    situation_id { 2 }
    freight_id { 2 }
    dep_place_id { 2 }
    schedule_date_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
