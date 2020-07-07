module ApplicationHelper
	def current_user_account
		if current_user && current_user.account
		  if current_user.account.persisted?
		    @current_user_account ||= current_user.account
		  end
		end
	end

	def redirect_back_or(default)
	  redirect_to(session[:forwarding_url] || default)
	  session.delete(:forwarding_url)
	end

	def store_location
	  session[:forwarding_url] = request.original_url if request.get?
	end
end
