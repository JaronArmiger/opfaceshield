class OrdersController < ApplicationController
	before_action :account_set_up?
	def new
	  @order = Order.new
	end

	private

	  def account_set_up?
	  	if !current_user_account
	  	  flash[:alert] = "Finish account set up before placing order."
	  	  store_location
	  	  redirect_to new_account_path
	  	end
	  end
end
