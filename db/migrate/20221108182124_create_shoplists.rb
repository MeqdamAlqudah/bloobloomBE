class CreateShoplists < ActiveRecord::Migration[7.0]
  def change
    create_table :shoplists do |t|
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
