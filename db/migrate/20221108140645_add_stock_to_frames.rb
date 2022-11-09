class AddStockToFrames < ActiveRecord::Migration[7.0]
  def change
    add_column :frames, :stock, :integer, :default => 0
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
