class AddLongitudeAndLatitudeToVenues < ActiveRecord::Migration
	def change
		change_table :venues do |t|
			t.decimal :latitude, precision: 9, scale: 6
			t.decimal :longitude, precision: 9, scale: 6
		end
	end
end
