class CreateEbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
