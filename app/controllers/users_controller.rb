class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create]
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_user_path, :notice => "Successfully signed up"
		else
			render 'new', :notice => "Error signing up"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :location, :password, :password_confirmation, :image)
	end
end
