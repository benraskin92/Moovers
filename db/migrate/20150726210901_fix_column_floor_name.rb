class FixColumnFloorName < ActiveRecord::Migration
  def change
  	rename_column :posts, :floor, :from_floor
  end
end
