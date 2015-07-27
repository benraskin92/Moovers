class Post < ActiveRecord::Base
	has_many :bids, dependent: :destroy
	belongs_to :user

	geocoded_by :to_address,   :latitude   => :to_lat,   :longitude => :to_long

	def to_address
		[tostreet, tocity, tostate].compact.join(', ')
	end

	def from_address
		[fromstreet, fromcity, fromstate].compact.join(', ')
	end

	def from_address_coords
		coords = Geocoder.coordinates(self.from_address)
		self.from_lat = coords[0]
		self.from_long = coords[1]
	end

	before_save :from_address_coords

	after_validation :geocode

end