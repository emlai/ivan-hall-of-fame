class Version < ApplicationRecord
  has_many :scores
  validates_uniqueness_of :string

  def to_param
    string
  end
end
