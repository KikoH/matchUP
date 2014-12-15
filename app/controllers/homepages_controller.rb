class HomepagesController < ApplicationController
	skip_before_filter :require_login, only: [:index]

	def index
		@games = Game.all
		@game = Game.new
		@users = User.all
		@user = User.new
	end

end