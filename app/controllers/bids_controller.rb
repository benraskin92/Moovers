class BidsController < ApplicationController

	def new
		@bid = Bid.new
		@post = Post.find(params[:id])
	end

	def show
		@bid = bids.find(params[:id])
	end

	def index
		@bid = Post.find(params[:id]).bids
	end

	def create 
		@bid = Bid.new(bid_params)
		if @bid.save
			redirect_to root_path
			flash[:notice] = 'Bid received!'
		else
			@post = Post.find(bid_params[:post_id])
			render 'new'
		end
	end

	def bid_params
		params.require(:bid).permit(:price, :company_name, :company_street, :company_city,
									:company_zip, :company_phone, :company_email, :post_id)
	end

end
