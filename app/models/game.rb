class Game < ActiveRecord::Base
	# belongs_to :owner, class_name: "User"
	# belongs_to :challenger, class_name: "User"
	belongs_to :venue
	has_many :players
	has_many :users, through: :players

	def pretty_booked_from
		booked_from.strftime("%I:%M %p")
	end

	def pretty_booked_till
		booked_till.strftime("%I:%M %p")
	end

	def challengers_count
		p = players.where(is_owner: false).count
		required_teams - p
	end

	def is_owner(current_user)
		User.find(players.where(is_owner: true).first.user_id) == current_user
	end

	def owner
		User.find(players.where(is_owner: true).first.user_id)
	end
end

