class CreateProductArrangements < ActiveRecord::Migration
  def change
    create_table :product_arrangements do |t|
      t.string :product_id

      t.timestamps
    end
  end
end
