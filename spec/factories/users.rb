FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }  # ニックネームの生成
    email { Faker::Internet.email }      # ユニークなメールアドレスの生成
    password { 'password1' }             # 英字と数字を含むパスワード
    password_confirmation { password }   # パスワード確認用
    last_name { '山田' }                 # 日本語の姓
    first_name { '太郎' }                # 日本語の名
    last_name_kana { 'ヤマダ' }          # カタカナの姓
    first_name_kana { 'タロウ' }         # カタカナの名
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) } # 誕生日を適切な範囲で生成
  end
end