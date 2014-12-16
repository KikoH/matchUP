namespace :venues do
	desc "Update existing venues without coordinates"
	task :update_coordinates => :environment do
		venues = Venue.where(latitude: nil, longitude: nil)

		venues.each do |venue| 
			venue.geocode

			if venue.save
				puts "#{venue.name} was successfully updated"
			else
				puts "ERROR: #{restaurant.name} with id #{restaurant.id}"
			end
		end
	end
end
