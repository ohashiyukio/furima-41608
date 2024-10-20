class User < ApplicationRecord
 has_many :items
 belongs to :address
end
