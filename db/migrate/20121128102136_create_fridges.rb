class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
