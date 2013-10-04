class RenameColumnLeaderToIsLeader < ActiveRecord::Migration
  def change
    rename_column :teams, :leader, :is_leader
  end
end
