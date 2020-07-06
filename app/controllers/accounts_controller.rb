class AccountsController < ApplicationController
	include AccountsHelper
	
	def show
		@account = Account.find(params[:id])
	end

	def new
	  @account = Account.new
	  @account.addresses.build
	end

	def create
	  account_attributes = filter_params(account_new_params)
	  @account = current_user.build_account(account_attributes)
	  if @account.save
	  	flash[:success] = "Account info saved!"
	  	redirect_to account_path(@account)
	  else
	  	render :new
	  end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		account_attributes = filter_params(account_edit_params)
		@account = Account.find(params[:id])
		@account.update_attributes(account_attributes)
		if @account.save
			flash[:success] = "Account info updated!"
			redirect_to account_path(@account)
		else
			render :edit
		end
	end

	private

	  def account_new_params
	  	params.require(:account).permit(:institution_name,
	  									:institution_type,
	  									:contact_first_name,
	  									:contact_last_name,
	  									:phone_number,
	  									:other_type,
	  									addresses_attributes: 
	  									[:street_address, :city,
	  									 :state, :zipcode])
	  end

	  def account_edit_params
	  	params.require(:account).permit(:institution_name,
	  									:institution_type,
	  									:contact_first_name,
	  									:contact_last_name,
	  									:phone_number,
	  									:other_type)
	  end

	  def filter_params(params_hash)
	    unless params_hash[:other_type] == ""
	      params_hash[:institution_type] = params_hash[:other_type]
	    end
	    params_hash.delete(:other_type)
	    params_hash
	  end
end
