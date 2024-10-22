class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  #has_one :buyer_record
  has_one_attached :image

  belongs_to :category
  belongs_to :situation
  belongs_to :freight
  belongs_to :dep_place
  belongs_to :schedule_date
  
  validates :user, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :exp, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :situation_id, presence: true, numericality: { other_than: 1 }
  validates :freight_id, presence: true, numericality: { other_than: 1 }
  validates :dep_place_id, presence: true, numericality: { other_than: 1 }
  validates :schedule_date_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

                    def sales_fee
                      (price * 0.1).floor # 販売手数料は10%で計算し、小数点以下は切り捨て
                    end
                  
                    def sales_profit
                      (price - sales_fee).floor # 販売利益は価格から手数料を引いた金額で、小数点以下は切り捨て
                    end
                  end
