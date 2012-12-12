class AddIndexToFridgeFriends < ActiveRecord::Migration
  def change
  	add_index :fridge_friends, [:user_id, :friend_id]
  end
end
