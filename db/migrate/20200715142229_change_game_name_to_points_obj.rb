class ChangeGameNameToPointsObj < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :name, :goal_points
  end
end
