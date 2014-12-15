class Game < ActiveRecord::Base
	belongs_to :venue
	has_many :players
	has_many :teams, through: :players

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
		Team.find(players.where(is_owner: true).first.team_id) == current_user
	end

	def owner
		Team.find(players.where(is_owner: true).first.team_id)
	end

	def challengers
		players.where(is_owner: false)
	end
end

