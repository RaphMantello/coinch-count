class ChangeScoresDefaultToZeroForGame < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :score_1, :integer, default: 0
    change_column :games, :score_2, :integer, default: 0

  end
end
