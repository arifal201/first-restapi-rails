class Order < ApplicationRecord
  extend Enumerize

  include PgSearch::Model
  pg_search_scope :search, against: %i[date status]
    ,using: {
      tsearch: {
        prefix: true
      }
    }

  enumerize :status, in: %i[paid pending cancel], default: :pending

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  accepts_nested_attributes_for :order_details
end
