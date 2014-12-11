class GamesController < ApplicationController
	def index
		@games = Game.all
		@game = Game.new
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		@game.owner_id = current_user.id
		@venue = @game.venue

		if @game.save
			redirect_to games_path
		else
			render 'new'
		end
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])

		if @game.update_attribute(:challenger_id, current_user.id)
			redirect_to games_path
		else
			redirect_to games_path
		end
	end

	private
	def game_params
		params.require(:game).permit(:title, :booked_from, :booked_till, :venue_id, :required_teams, :challenger_id)
	end
end
