require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
	def setup
	  @regular_user = users(:alfonso)
	  @regular_user.confirm
	  @admin = users(:admin)
	  @admin.confirm
	end

	test "no routes available with no user signed in" do
	  get admin_orders_path
	  assert_redirected_to new_user_session_path
	end

	test "non-admin should be redirected" do
	  sign_in @regular_user
	  get orders_path
	  assert_response :success
	  get admin_orders_path
	  assert_redirected_to root_path
	end

	test "admin should be able to access admin routes" do
	  sign_in @admin
	  get orders_path
	  assert_response :success
	  get admin_orders_path
	  assert_response :success
	end
end