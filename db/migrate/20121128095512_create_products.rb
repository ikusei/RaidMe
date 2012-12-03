class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :marke
      t.string :ort
      t.date :datum

      t.timestamps
    end
  end
end
