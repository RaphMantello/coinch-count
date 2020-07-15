class AddGoalPointsColumnToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :goal_points, :integer
  end
end
