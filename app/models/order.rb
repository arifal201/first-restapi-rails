class Order < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i[paid pending cancel], default: :pending

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  accepts_nested_attributes_for :order_details
end
