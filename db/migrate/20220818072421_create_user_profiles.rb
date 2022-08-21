class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name, null: true
      t.string :full_name 
      t.string :birth_date
      t.string :gender

      t.timestamps
    end
  end
end
