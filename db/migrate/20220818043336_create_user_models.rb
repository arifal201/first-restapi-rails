class CreateUserModels < ActiveRecord::Migration[6.0]
  def change
    create_table :user_models do |t|

      t.timestamps
    end
  end
end
