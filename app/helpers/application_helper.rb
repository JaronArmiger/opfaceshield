module ApplicationHelper
	def current_user_account
		if current_user
		  @current_user_account ||= current_user.account
		end
	end
end
