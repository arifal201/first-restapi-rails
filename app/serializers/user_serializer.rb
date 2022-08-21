class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_profile

  def user_profile
      user_profile = object.try(:user_profile)

      return unless user_profile.present?

      UserProfileSerializer.new(user_profile)
  end
end
