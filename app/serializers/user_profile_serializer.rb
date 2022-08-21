class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :gender, :birth_date

  def name
    object.full_name
  end
end