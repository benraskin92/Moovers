class AddWebsiteToBids < ActiveRecord::Migration
  def change
    add_column :bids, :website, :string
  end
end
