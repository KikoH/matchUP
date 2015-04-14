class UserSessionsController < ApplicationController
	skip_before_filter :require_login, except: [:destroy]

	def new
		@team = Team.new
	end

	def create
		if @team = login(params[:email], params[:password])
			redirect_back_or_to(:games)
		else
			flash.now[:alert] = 'Login failed. Try again'
			render 'new'
		end
	end

	def destroy
		logout
		redirect_to(:home, notice: 'Logged out!')
	end
end
