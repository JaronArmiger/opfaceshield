class AccountsController < ApplicationController
	include AccountsHelper
	def new
	  @account = Account.new
	end

	def create
		raise params.inspect
	end
end
