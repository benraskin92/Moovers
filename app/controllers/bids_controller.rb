class BidsController < ApplicationController
	before_action :logged_in_user

#Instantiates a new Bid class 
	def new
		if current_user.acct_type == 'mover'
			@bid = Bid.new
			@post = Post.find(params[:id])
		else 
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end
	end

#Show method for /views/bids/show.html.erb
	def show
		if current_user.acct_type == 'mover'
			@bid = bids.find(params[:id])
		else 
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end	
	end

#This shows all of the bids for /views/bids/index.html.erb
#Probably won't need this in the future
	def index
		@bid = Post.find(params[:id]).bids
	end

#Essentially saves a bid to the database
#Also, instructions on what to do if bid isn't saved
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

#Defines what the bid parameters are
	def bid_params
		params.require(:bid).permit(:price, :company_name, :company_street, :company_city,
									:company_zip, :company_phone, :company_email, :post_id)
	end

end
