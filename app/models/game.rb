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

	def remaining_challengers
		p = players.where(is_owner: false).count
		required_teams - p
	end

	def is_owner(current_user)
		Team.find(players.where(is_owner: true).first.team_id) == current_user
	end

	def owner
		players.where(is_owner: true).first
	end

	def is_challenger(team)
		challenger = players.where(is_owner: false).map {|player| player.team}
		challenger.include?(team)
	end

	def challengers
		players.where(is_owner: false)
		# Team.find_all(players.where(is_owner: false).pluck(:team_id))
	end

	def venue_open
		v = Venue.find(12)
		v.open_time.strftime("%I").to_i
	end

	def venue_close
		v = Venue.find(12)
		v.close_time.strftime("%I").to_i
	end
end

