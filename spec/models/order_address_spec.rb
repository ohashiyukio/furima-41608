require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_noが空だと保存できないこと' do
        @order_address.post_no = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post no can't be blank")
      end

      it 'post_noが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_no = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post no is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'dep_place_idが1では保存できないこと' do
        @order_address.dep_place_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Dep place can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'city_noが空だと保存できないこと' do
        @order_address.city_no = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City no can't be blank")
      end

      it 'phone_noが空だと保存できないこと' do
        @order_address.phone_no = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone no can't be blank")
      end

      it 'phone_noが9桁以下でないと保存できないこと' do
        @order_address.phone_no = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone no is invalid. Input only number')
      end

      it 'phone_noが12桁以上でないと保存できないこと' do
        @order_address.phone_no = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone no is invalid. Input only number')
      end

      it 'phone_noに半角数字以外が含まれていると保存できないこと' do
        @order_address.phone_no = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone no is invalid. Input only number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
