class RenameUserToTeam < ActiveRecord::Migration
  def change
  	remove_column :players, :user_id
  	add_column :players, :team_id, :integer
  end
end
