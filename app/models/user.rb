# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  pg_search_scope :search, against: %i[email],associated_against: {
    user_profile: %i[full_name birth_date]
  },using: {
    tsearch: {
      prefix: true
    }
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP

  has_one :user_profile, dependent: :destroy
  has_many :bookmarks

  has_many :access_token,
  class_name: 'Doorkeeper::AccessToken',
  foreign_key: :resource_owner_id,
  dependent: :delete_all

  accepts_nested_attributes_for :user_profile
  accepts_nested_attributes_for :bookmarks
  
  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end