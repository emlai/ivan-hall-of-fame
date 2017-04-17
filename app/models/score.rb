class Score < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :version
  validates :points, :character, :entry, presence: true

  def self.sorted
    Score.order(points: :desc)
  end
end
