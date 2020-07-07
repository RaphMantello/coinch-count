class Game < ApplicationRecord
  has_many :biddings, dependent: :destroy
end
