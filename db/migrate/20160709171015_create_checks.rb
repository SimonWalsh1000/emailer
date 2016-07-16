class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :name
      t.string :string
      t.string :email

      t.timestamps null: false
    end
  end
end
