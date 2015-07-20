class Post < ActiveRecord::Base
	has_many :bids, dependent: :destroy
	belongs_to :user
end
