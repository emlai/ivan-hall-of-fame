class Player < ApplicationRecord
  validates :name, presence: true

  def attnam_link
    "https://attnam.com/users/" + attnam_username if attnam_username
  end
end
