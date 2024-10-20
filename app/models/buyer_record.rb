class BuyerRecord < ApplicationRecord
 belongs_to :item
 has_one :addresses
end
