class PostsController < ApplicationController
	before_action :my_post?, if: !current_user.admin?

	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	  def my_post?
	  	@post = current_user.posts.find_by(id: params[:id])
	  	redirect_to root_path if @post.nil?
	  end
end
