class AddAndRemoveColumns < ActiveRecord::Migration
  def change
  	add_column :games, :booked_from, :datetime
  	add_column :games, :booked_till, :datetime
  	remove_column :games, :time_booked
  end
end 
