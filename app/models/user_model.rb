class UserModel < ApplicationRecord
  extend Enumerize

  validates_presence_of :first_name, :gender
  validates_date :birth_date, invalid_date_message: "birth_date must be date format"
  enumerize :gender, in: %i[male female], default: :male
  
  belongs_to :user, optional: true

  has_one  :user_profile, dependent: :destroy
  
  has_many :access_tokens,
          class_name: 'Doorkeeper::AccessToken',
          foreign_key: :resource_owner_id,
          dependent: :delete_all

  accepts_nested_attributes_for :user_profile
end
