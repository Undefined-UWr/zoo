class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :admin?, :admin_fillter

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def admin?
		(User.find(session[:user_id])).admin=="t" if session[:user_id]
	end

	def admin_fillter
		redirect_to root_url if not admin?
	end

end
