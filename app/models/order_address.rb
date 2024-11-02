class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_no, :dep_place_id, :city, :city_no, :building, :phone_no, :token

  # バリデーション
  with_options presence: true do
    validates :token, presence: { message: "can't be blank" }
    validates :user_id, presence: { message: "can't be blank" }
    validates :item_id, presence: { message: "can't be blank" }
    validates :post_no, presence: { message: "can't be blank" },
                        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :dep_place_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: { message: "can't be blank" }
    validates :city_no, presence: { message: "can't be blank" }
    validates :phone_no, presence: { message: "can't be blank" },
                         format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  end

  # 保存メソッド
  def save
    # 購入履歴を保存し、そのIDを使用して住所情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_no: post_no, dep_place_id: dep_place_id, city: city, city_no: city_no, building: building,
                   phone_no: phone_no, order_id: order.id)
  end
end
