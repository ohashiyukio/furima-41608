class Item < ApplicationRecord
 has_one :buyer_record
 belongs_to :user
 has_one :addresses
end
