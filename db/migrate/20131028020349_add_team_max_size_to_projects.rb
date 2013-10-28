class AddTeamMaxSizeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :team_max_size, :int
  end
end
