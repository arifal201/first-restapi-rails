class UserProfile < ApplicationRecord
  extend Enumerize

  validates_presence_of :first_name, :gender
  validates_date :birth_date, invalid_date_message: "birth_date must be a date"

  enumerize :gender, in: %i[male female], default: :male

  belongs_to :user, optional: true

  # has_many :bookmarks, dependent: :destroy

  before_save :set_full_name

  def set_full_name
    self.full_name = self.first_name + " " + self.last_name
  end
end
