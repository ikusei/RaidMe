class AddAcceptanceToFridgeFriend < ActiveRecord::Migration
  def change
  	add_column :fridge_friends, :acceptance, :boolean, :default => false
  end
end
