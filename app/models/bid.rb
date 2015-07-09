class Bid < ActiveRecord::Base
	belongs_to :post
	validates :price, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :company_email, presence: true, 
					format: { with: VALID_EMAIL_REGEX}
	#validates :post_id, presence: true
end
