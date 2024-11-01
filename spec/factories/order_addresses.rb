FactoryBot.define do
  factory :order_address do
    post_no { '123-4567' }
    dep_place_id { 2 }
    city { '新宿区' }
    city_no { '1-1-1' }
    building { 'ビル101' }
    phone_no { '09012345678' }
    token {'sample_token' }
  
    
  end
end
