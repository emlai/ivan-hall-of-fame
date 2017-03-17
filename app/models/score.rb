class Score < ApplicationRecord
  belongs_to :player, optional: true
  validates :points, :character, :entry, presence: true

  def self.sorted
    Score.order(points: :desc)
  end
end
