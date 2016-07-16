class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :institute

      t.timestamps null: false
    end
  end
end
