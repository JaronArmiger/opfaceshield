class AddressesController < ApplicationController
	def new

	end

	def create
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		@address.update_attributes(address_params)
		if @address.save
		  flash[:success] = "Address updated!"
		  redirect_to account_path(current_user_account)
		else
			render :edit
		end
	end

	def delete
	end

	private

	  def address_params
	  	params.require(:address).permit(:street_address,
	  									:city, :state,
	  									:zipcode)
	  end
end
