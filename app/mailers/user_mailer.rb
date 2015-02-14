class UserMailer < ActionMailer::Base
	default from: "kiko@matchup.com"

	def welcome_email(team)
		@team = team
		@url  = 'http://localhost:3000/'

		mail(to: @team.email, subject: 'Welcome to My Awesome Site')
	end

	def matchup_email(owner, player)
		@owner = owner
		@challenger = player

		mail(to: @owner.team.email , subject: 'You have been challenged')
	end 
end
