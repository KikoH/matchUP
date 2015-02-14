class HomepagesController < ApplicationController
	skip_before_filter :require_login

	def index
		@games = Game.all
		@game = Game.new
		@teams = Team.all
		@team = Team.new
	end

end