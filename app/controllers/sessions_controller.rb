class SessionsController < ApplicationController

	skip_before_action :require_login

	def new
	end

	def create
		user = login(params[:email], params[:password])
		if user
			redirect_back_or_to root_url :notice => "Login successful"
		else
			flash.now.alert = "Login credentials invalid."
		end
	end

	def destroy
		logout
		redirect_to root_url, :notice => "Logged out!"
	end

end
