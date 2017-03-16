class Player < ApplicationRecord
  has_many :scores
  validates :name, presence: true

  def attnam_link
    "https://attnam.com/users/" + attnam_username if attnam_username
  end
end
