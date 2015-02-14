class VenuesController < ApplicationController
	skip_before_filter :require_login
	
	def new
		@venue = Venue.new
	end

	def create
		@venue = Venue.new(venue_params)

			if @venue.save
				redirect_to venue_path(@venue)
			else
				render 'new'
			end
	end

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

	private
	def venue_params
		params.require(:venue).permit(:name, :address, :open_time, :close_time)
	end
end
