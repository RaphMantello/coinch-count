class CreateBiddings < ActiveRecord::Migration[6.0]
  def change
    create_table :biddings do |t|
      t.integer :bid_points
      t.string :bid_color
      t.integer :bid_team
      t.string :countered
      t.integer :points
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
