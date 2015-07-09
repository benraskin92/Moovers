class AddMovingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :fromstreet, :string
    add_column :posts, :fromcity, :string
    add_column :posts, :fromstate, :string
    add_column :posts, :fromzip, :string
    add_column :posts, :tostreet, :string
    add_column :posts, :tocity, :string
    add_column :posts, :tostate, :string
    add_column :posts, :tozip, :string
    add_column :posts, :bedrooms, :string
    add_column :posts, :walkup, :boolean
    add_column :posts, :floor, :integer
    add_column :posts, :date, :date
    add_column :posts, :notes, :text
  end
end
