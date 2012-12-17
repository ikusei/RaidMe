class AddInterstToProductArrangement < ActiveRecord::Migration
  def change
  	add_column :product_arrangements, :interest_id, :integer
  	change_column :product_arrangements, :product_id, :integer
  end
end
