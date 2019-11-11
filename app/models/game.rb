class Game < ApplicationRecord
  validates :title, presence: true
  validates :console, uniqueness: {
    scope: :title,
    message: "Cannot have multiples of a title on the same console"
  }
  validates :description, presence: true

  has_many :listings
  has_many :users, through: :listings
  has_many :swaps, through: :listings
end
