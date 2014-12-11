class AddColumnToGame < ActiveRecord::Migration
  def change
  	add_column :games, :required_teams, :integer
  end
end
