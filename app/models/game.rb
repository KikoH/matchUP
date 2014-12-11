class Game < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	belongs_to :challenger, class_name: "User"
	belongs_to :venue

	def pretty_booked_from
		booked_from.strftime("%I:%M %p")
	end

	def pretty_booked_till
		booked_till.strftime("%I:%M %p")
	end
end
