class VenuesController < ApplicationController
	def index
		@venues = if params[:search]
			Venue.near(params[:search], 1, units: :km)
		elsif params[:latitude] && params[:longitude]
			Venue.near([params[:latitude], params[:longitude]], 1, units: :km)
		else
			Venue.all
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@venue = Venue.find(params[:id])
	end
end
