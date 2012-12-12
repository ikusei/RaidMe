class RemoveStatusFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :status
  end
end
