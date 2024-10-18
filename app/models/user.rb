class User < ApplicationRecord
 has_many :items
 belonds to :address
 has_many :buyer_record
end
