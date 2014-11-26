class StaticPageController < ApplicationController
	before_filter :admin, :except => [ :user, :home ]
	def home
	end

	def user

	end

	def admin
		@users=User.all
	end
end
