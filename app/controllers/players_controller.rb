class PlayersController < ApplicationController
	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)
		@game = @player.game
		@owner = @game.players.where(is_owner: true).first

		if @player.save
			UserMailer.matchup_email(@owner, @player).deliver

			redirect_to games_path
		else
			redirect_to games_path
		end
	end

	def player_params
		params.require(:player).permit(:team_id, :game_id, :is_owner)
	end
end
