class PostsController < ApplicationController
	#Any user has to be signed in
	before_action :logged_in_user
	#Posts owner needs to be signed in
	before_action :post_owner, only: [:edit, :update, :show]

#Instantiates a new post in /view/posts/new
#Only 'individual accounts can create posts'
	def new
		if current_user.acct_type == 'individual'
			@post = current_user.posts.new
		else
			redirect_to root_path
			flash[:notice] = 'You do not have the correct account type'
		end
	end

#Show controller for /views/posts/:id
#Shows the individual post
#Need to be owner of post (see above)
	def show
		@post = Post.find(params[:id])
	end

	def time_left(time_created_at)
		time_left = time_created_at + 2.days
	end

#Shows users' posts if 'individual' is signed in
#Shows ALL posts if mover is signed in
	def index
		if current_user.acct_type == 'individual'
			@post = current_user.posts
		else
			@post = Post.all
		end
	end

#Saves post to the database
	def create 
		@post = Post.new(post_params)
		if @post.save
			redirect_to root_path
			flash[:notice] = 'Moving information added!'
		else
			render 'new'
		end
	end

#Edit a post - requires post_owner
	def edit
		@post = Post.find(params[:id])
	end

#Saves 'edited' post to database
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			flash[:success] = "Post updated!"
			redirect_to root_path
		else
			render 'edit'
		end
	end

#Defines post parameters
	def post_params
		params.require(:post).permit(:fromcity, :fromstate, :fromstreet, :fromzip,
								:tocity, :tostreet, :tostate, :tozip,
								:bedrooms, :walkup, :floor, :date, :notes, :user_id)
	end

end
