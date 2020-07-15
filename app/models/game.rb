class Game < ApplicationRecord
  has_many :biddings, dependent: :destroy

  validates :goal_points, presence: true
end
