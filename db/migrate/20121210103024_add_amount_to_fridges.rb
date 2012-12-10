class AddAmountToFridges < ActiveRecord::Migration
  def change
  	add_column :fridges, :amount, :integer, :default => 1
  end
end
