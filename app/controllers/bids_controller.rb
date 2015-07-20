class BidsController < ApplicationController
	before_action :logged_in_user

#Instantiates a new Bid class 
	def new
		post = Post.find(params[:id]).id
		@bid_count = Bid.find_by_sql("SELECT * FROM bids b WHERE b.user_id = #{current_user.id} AND b.post_id = #{post} ")
		bid_count = @bid_count.count
		if (current_user.acct_type == 'mover' && bid_count < 1)  
			@bid = Bid.new
			@post = Post.find(params[:id])
		elsif (current_user.acct_type == 'mover' && bid_count >= 1)
			redirect_to root_path
			flash[:danger] = 'You already placed a bid!'
		elsif current_user.acct_type == 'individual'
			redirect_to root_path
			flash[:danger] = 'You do not have the correct account type'
		end
	end

#This shows all of the bids for /views/bids/index.html.erb
	def index
		@bid = Post.find(params[:id]).bids
		if (current_user.acct_type == 'mover')
			@bid = current_user.bids
		end
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
									:company_zip, :company_phone, :company_email, :post_id,
									:user_id, :website)
	end

end
