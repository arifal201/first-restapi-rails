class ApplicationController < ActionController::API
  before_action :doorkeeper_authorize!
  include Response

  private

  # helper method to access the current user from the token
  # def current_user
  #   return if doorkeeper_token.nil?

  #   if doorkeeper_token.resource_owner_id.present?
  #     User.find(doorkeper_token.resource_owner_id)
  #   else
  #     'client_credentials'
  #   end
  # end
end