class Post < ActiveRecord::Base
	has_many :bids, dependent: :destroy
	belongs_to :user

	geocoded_by :from_address, :latitude => :from_lat, :longitude => :from_long
	geocoded_by :to_address, :latitude => :to_lat, :longitude => :to_long
	after_validation :geocode

	def from_address
		[fromstreet, fromcity, fromstate].compact.join(', ')
	end

	def to_address
		[tostreet, tocity, tostate].compact.join(', ')
	end
end