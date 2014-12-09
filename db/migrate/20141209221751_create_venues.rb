class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string :name
    	t.string :address
    	t.datetime :open_time
    	t.datetime :close_time

      t.timestamps
    end
  end
end
