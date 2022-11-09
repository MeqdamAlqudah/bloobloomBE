class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.integer :frame_id
      t.integer :lense_id
      t.integer :shoplist_id
      t.integer :user_id
      t.float :price
      t.string :price_currency,default: "USD"
      t.timestamps
    end
  end
end
