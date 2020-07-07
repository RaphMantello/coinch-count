class AddScoresToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :score_1, :integer
    add_column :games, :score_2, :integer
  end
end
