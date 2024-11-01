FactoryBot.define do
  factory :order do
    name { '鈴木' }
    name_reading { 'スズキ' }
    nickname { 'suzuki' }
    email { 'test@example' }
    password { 'test1234' }
    password_confirmation { password }
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
