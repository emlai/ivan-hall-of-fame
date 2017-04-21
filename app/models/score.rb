class Score < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :version
  validates :points, :character, :entry, presence: true
  validates :points, numericality: { greater_than: 0 }

  def self.sorted(filter = {})
    Score.where(filter).order(points: :desc)
  end
end
