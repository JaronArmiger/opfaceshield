class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  	@posts = Post.order('created_at DESC')
  end

end
