class Address < ApplicationRecord
  belongs_to :buyer_record
  belongs_to :items
  has_one :user
end
