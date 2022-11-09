class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.string :name
      t.text :description
      t.string :status,default:"Active"
      t.float :price 
      t.string :price_currency ,default: "USD"
      t.timestamps
    end
  end
end
