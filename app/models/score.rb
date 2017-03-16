class Score < ApplicationRecord
  belongs_to :player
  validates :player, :points, :character, presence: true

  def self.sorted
    Score.order(points: :desc)
  end
end
