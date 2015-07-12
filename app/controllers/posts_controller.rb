class PostsController < ApplicationController
	before_action :require_user

	def new
		if current_user.acct_type == 'individual'
			@post = current_user.posts.new
		else
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def time_left(time_created_at)
		time_left = time_created_at + 2.days
	end

	def index
		if current_user.acct_type == 'individual'
			@post = current_user.posts
		else
			@post = Post.all
		end
	end

	def create 
		@post = Post.new(post_params)
		if @post.save
			redirect_to root_path
			flash[:notice] = 'Moving information added!'
		else
			render 'new'
		end
	end

	def post_params
		params.require(:post).permit(:fromcity, :fromstate, :fromstreet, :fromzip,
								:tocity, :tostreet, :tostate, :tozip,
								:bedrooms, :walkup, :floor, :date, :notes, :user_id)
	end

end
