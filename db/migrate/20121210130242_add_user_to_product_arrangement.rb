class AddUserToProductArrangement < ActiveRecord::Migration
  def change
  	add_column :product_arrangements, :user_id, :integer
  	add_column :product_arrangements, :acceptance, :boolean
  end
end
