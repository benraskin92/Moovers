class AddOtherLatLongToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :to_lat, :float
    add_column :posts, :to_long, :float
  end
end
