class Customer < ApplicationRecord
    has_many :orders
    has_many :order_details

    include PgSearch::Model
    pg_search_scope :search, against: %i[name address],
      using: {
        tsearch: {
          prefix: true
        }
      }

    mount_uploader :picture, ImageUploader
end
