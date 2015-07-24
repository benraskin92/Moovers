class AddFromLatLongToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :from_lat, :float
    add_column :posts, :from_long, :float
  end
end
