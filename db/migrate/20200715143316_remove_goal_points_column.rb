class RemoveGoalPointsColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :goal_points
  end
end
