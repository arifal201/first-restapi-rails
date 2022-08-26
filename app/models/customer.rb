class Customer < ApplicationRecord
    has_many :orders
    has_many :order_details
end
