class Bidding < ApplicationRecord
  belongs_to :game

  validates :bid_points, presence: true
  validates :bid_color, presence: true
  validates :bid_team, presence: true
  validates :belote, presence: true
  validates :countered, presence: true
  validates :points, presence: true
end
