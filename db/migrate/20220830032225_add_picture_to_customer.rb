class AddPictureToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :picture, :string
  end
end
