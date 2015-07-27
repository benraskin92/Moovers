class AddToFloorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :to_floor, :integer
  end
end
