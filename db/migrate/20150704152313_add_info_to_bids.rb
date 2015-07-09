class AddInfoToBids < ActiveRecord::Migration
  def change
    add_column :bids, :price, :decimal
    add_column :bids, :company_name, :string
    add_column :bids, :company_street, :string
    add_column :bids, :company_city, :string
    add_column :bids, :company_state, :string
    add_column :bids, :company_zip, :string
    add_column :bids, :company_phone, :string
    add_column :bids, :company_email, :string
    add_reference :bids, :post, index: true, foreign_key: true
  end
end
