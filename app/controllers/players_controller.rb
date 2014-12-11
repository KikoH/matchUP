class PlayersController < ApplicationController
	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)

		if @player.save
			redirect_to games_path
		else
			redurect_to games_path
		end
	end

	def player_params
		params.require(:player).permit(:user_id, :game_id, :is_owner)
	end
end
