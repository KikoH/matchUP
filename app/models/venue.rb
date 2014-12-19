class Venue < ActiveRecord::Base
	has_many :games

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	def pretty_open_time
		open_time.strftime("%I:%M %p")
	end

	def pretty_close_time
		close_time.strftime("%I:%M %p")
	end
end
