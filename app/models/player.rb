class Player < ApplicationRecord
  has_many :scores
  has_secure_token :auth_token # Authentication token for submitting highscores.
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :name, uniqueness: true, presence: true

  def attnam_link
    "https://attnam.com/users/" + attnam_username if attnam_username
  end
end
