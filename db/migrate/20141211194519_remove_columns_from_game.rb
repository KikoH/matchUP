class RemoveColumnsFromGame < ActiveRecord::Migration
  def change
  	remove_column :games, :user_id
  	remove_column :games, :challenger_id
  	remove_column :games, :owner_id
  end
end
