class Score < ApplicationRecord
  belongs_to :player
  validates :player, :points, :character, presence: true
end
