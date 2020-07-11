require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
  	@user = users(:alfonso)
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "content should be <= 140 chars" do
  	@post.content = "w" * 141
  	assert_not @post.valid?
  end

  test "deleting user deletes all user's posts" do
  	assert_not @user.posts.empty?
  	assert_equal @user, @post.user
  	@user.destroy
  	assert_equal Post.count, 0
  end
end
