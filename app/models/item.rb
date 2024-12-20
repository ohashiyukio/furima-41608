class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :situation
  belongs_to :freight
  belongs_to :dep_place
  belongs_to :schedule_date

  validates :image, presence: true
  validates :name, presence: true
  validates :exp, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :situation_id, presence: true, numericality: { other_than: 1 }
  validates :freight_id, presence: true, numericality: { other_than: 1 }
  validates :dep_place_id, presence: true, numericality: { other_than: 1 }
  validates :schedule_date_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: {
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999,
                      only_integer: true
                    },
                    format: { with: /\A\d+\z/, message: 'must be entered as whole numbers' }
end
