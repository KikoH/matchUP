class AddAndRemoveColumnsToGame < ActiveRecord::Migration
  def change
  	add_column :games, :owner_id, :integer
  	add_column :games, :challenger_id, :integer
  end
end
