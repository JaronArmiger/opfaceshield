class OrdersController < ApplicationController
	before_action :account_set_up?, only: [:new]

	def new
	  @order = Order.new
	end

	def create
	  raise params.inspect
	end

	private

	  def order_params
	  	params.require(:order).permit(:num_shields, :num_adjusters,
	  								  :message, :street_address, :city,
	  								  :state, :zipcode)
	  end

	  def account_set_up?
	  	if !current_user_account
	  	  flash[:alert] = "Finish account set up before placing order."
	  	  store_location
	  	  redirect_to new_account_path
	  	end
	  end
end
