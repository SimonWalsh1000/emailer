class AddInterestToLists < ActiveRecord::Migration
  def change
    add_column :lists, :interest, :string
  end
end
