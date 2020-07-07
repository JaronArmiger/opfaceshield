class OrdersController < ApplicationController
	before_action :account_set_up?, only: [:new]
	before_action :has_address?, only: [:new]

	def new
	  @order = Order.new
	end

	def create
	  
	  if (address_id = params[:order][:address_id])
	  	address = Address.find(address_id)
	  	p address
	  end
	end

	private

	  def order_params
	  	params.require(:order).permit(:num_shields, :num_adjusters,
	  								  :message, :street_address, :city,
	  								  :state, :zipcode, :address_id)
	  end

	  def account_set_up?
	  	if !current_user_account
	  	  flash[:alert] = "Finish account set up before placing order."
	  	  store_location
	  	  redirect_to new_account_path
	  	end
	  end

	  def has_address?
	  	if current_user_account.addresses.empty?
	  	  flash[:alert] = "Add address to your account before placing order."
	  	  store_location
	  	  redirect_to new_address_path
	    end
	  end
end
