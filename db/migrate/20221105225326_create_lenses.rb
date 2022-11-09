class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :colour
      t.text :description
      t.string :prescription_type
      t.string :lens_type
      t.integer :stock
      t.float :price 
      t.string :price_currency ,default: "USD"
      t.timestamps
    end
  end
end
