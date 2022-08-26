class Bookmark < ApplicationRecord
    validates_presence_of :title, :url

    belongs_to :user

end
