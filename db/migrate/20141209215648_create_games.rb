class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :venue_id
    	t.integer :user_id
    	t.string :title
    	t.datetime :time_booked

      t.timestamps
    end
  end
end
