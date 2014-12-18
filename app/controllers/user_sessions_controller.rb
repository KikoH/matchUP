class UserSessionsController < ApplicationController
	skip_before_filter :require_login, except: [:destroy]

	def new
		@team = Team.new
	end

	def create
		if @team = login(params[:email], params[:password])
			redirect_back_or_to(:home)
		else
			flash.now[:alert] = 'Login failed'
			render action: 'new'
		end
	end

	def destroy
		logout
		redirect_to(:home, notice: 'Logged out!')
	end
end
