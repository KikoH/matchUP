class GamesController < ApplicationController
	def index
		@games = Game.all
		@game = Game.new
		# User.find(@game.players.where(is_owner: true).first.user_id)
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)

		if @game.save
			@player = Player.new(user: current_user, game: @game, is_owner: true)
			if @player.save
				redirect_to games_path
			else
				render 'new'
			end
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
			render 'edit'
		end
	end

	private
	def game_params
		params.require(:game).permit(:title, :booked_from, :booked_till, :venue_id, :required_teams)
	end
end
