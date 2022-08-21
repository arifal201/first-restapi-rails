class AddRelationDoorkeeperTable < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :oauth_access_tokens, :users, column: :resource_owner_id
  end
end
