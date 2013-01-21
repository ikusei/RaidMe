class RemoveAcceptanceFromFridgeFriends < ActiveRecord::Migration
  def up
  	remove_column :fridge_friends, :acceptance
  end

  def dow
  	add_column :fridge_friends, :acceptance, :boolean
  end
end
