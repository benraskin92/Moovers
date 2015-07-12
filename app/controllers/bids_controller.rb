class BidsController < ApplicationController
	before_action :require_user

	def new
		if current_user.acct_type == 'mover'
			@bid = Bid.new
			@post = Post.find(params[:id])
		else 
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end
	end

	def show
		if current_user.acct_type == 'mover'
			@bid = bids.find(params[:id])
		else 
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end	
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
