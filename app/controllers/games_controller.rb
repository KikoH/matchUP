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
		@game.user_id = current_user.id
		@venue = @game.venue

		if @game.save
			redirect_to games_path
		else
			render 'new'
		end
	end

	private
	def game_params
		params.require(:game).permit(:title, :booked_from, :booked_till, :venue_id, :required_teams)
	end
end
