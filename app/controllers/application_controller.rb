class ApplicationController < ActionController::Base
	helper_method :logged_in?

	def require_login
		redirect_to controller: "home", action: "login" unless session[:user]
	end

	def logged_in?
		session.key? :user
	end
end
