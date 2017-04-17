class Score < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :version
  validates :points, :character, :entry, presence: true

  def self.sorted(filter = {})
    Score.where(filter).order(points: :desc)
  end
end
