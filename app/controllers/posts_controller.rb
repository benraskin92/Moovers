class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@post = Post.all
		@hash = Gmaps4rails.build_markers(@posts) do |post, marker|
		  marker.lat post.latitude
		  marker.lng post.longitude
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
								:bedrooms, :walkup, :floor, :date, :notes)
	end

end
