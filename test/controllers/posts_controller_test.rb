require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	@first_user.confirm
  	@second_user = users(:ozuna)
  	@second_user.confirm
  end

  test "should redirect if trying to access other user's posts" do
  	sign_in @first_user
  	post = @second_user.posts.first
  	get post_path(post)
  	assert_redirected_to root_path
  	get edit_post_path(post)
  	assert_redirected_to root_path
  	patch post_path(post)
  	assert_redirected_to root_path
  	delete post_path(post)
  	assert_redirected_to root_path
  end

  test "user should have access to routes for own post" do
  	sign_in @first_user
  	post = @first_user.posts.first
  	get posts_path
  	assert_reponse :success
  	get new_post_path
  	assert_reponse :success
  	post posts_path
  	assert_reponse :success
  	get post_path(post)
  	assert_reponse :success
  	get edit_post_path(post)
  	assert_reponse :success
  	patch post_path(post)
  	assert_reponse :success
  	delete post_path(post)
  	assert_reponse :success
  end

  test "should redirect if no account set up yet" do
  end

  test "admin should have access to all routes" do
  end
end
