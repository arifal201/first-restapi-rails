class Product < ApplicationRecord
    has_many :order_details, dependent: :destroy

    include PgSearch::Model
    pg_search_scope :search, against: %i[name price],
    using: {
      tsearch: {
        prefix: true
      }
    }

    mount_uploader :image, ImageUploader
end
