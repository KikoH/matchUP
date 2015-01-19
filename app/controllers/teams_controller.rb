class TeamsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create]
	before_filter :initializeGame

	def show
		@team = Team.find(params[:id])
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			UserMailer.welcome_email(@team).deliver

			auto_login(@team)
			redirect_to games_path, :notice => "Successfully signed up"
		else
			render 'new', :notice => "Error signing up"
		end
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(team_params)
			redirect_to team_path(@team)
		else
			render 'edit'
		end
	end

	private

	def team_params
		params.require(:team).permit(:email, :name, :location, :password, :password_confirmation, :image)
	end

	def initializeGame
		@game = Game.new
	end
end
