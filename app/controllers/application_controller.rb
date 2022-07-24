class ApplicationController < ActionController::Base
	def require_login
		redirect_to controller: "home", action: "login" unless session[:user]
	end
end
