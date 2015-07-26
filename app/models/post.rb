class Post < ActiveRecord::Base
	has_many :bids, dependent: :destroy
	belongs_to :user

	geocoded_by :to_address, :latitude => :to_lat, :longitude => :to_long
	after_validation :geocode

	def to_address
		[tostreet, tocity, tostate].compact.join(', ')
	end
end