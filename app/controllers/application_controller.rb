require 'rack-mini-profiler'

class ApplicationController < ActionController::Base
	helper_method :logged_in?

	before_action do
		if session.key? :user
		  Rack::MiniProfiler.authorize_request
		end
	  end

	def require_login
		redirect_to controller: "home", action: "login" unless session.key? :user
	end

	def logged_in?
		session.key? :user
	end
end
