class AccountsController < ApplicationController
	include AccountsHelper
	def new
	  @account = Account.new
	  @account.addresses.build
	end

	def create
	  account_attributes = filter_params(account_params)
	  @account = current_user.accounts.build(account_attributes)
	  
	end

	private

	  def account_params
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

	  def filter_params(params_hash)
	    unless params_hash[:other_type] == ""
	      params_hash[:institution_type] = params_hash[:other_type]
	    end
	    params_hash.delete(:other_type)
	    params_hash
	  end
end
