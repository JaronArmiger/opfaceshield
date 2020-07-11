class PostsController < ApplicationController
	before_action :my_post?, unless: :admin_user?, except: [:index, :new, :create]
	before_action :has_account?, except: [:index]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.image.attach(params[:post][:image])
		if @post.save
		  flash[:success] = "Post created!"
		  redirect_to post_path(@post)
		else
		  render :new
		end
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

	  def has_account?
	  	unless current_user_account
	  	  flash[:alert] = "Finish setting up your account first!"
	  	  redirect_to root_path
	  	end
	  end

	  def post_params
	  	params.require(:post).permit(:content, :image)
	  end
end
