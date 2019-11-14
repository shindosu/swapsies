class Game < ApplicationRecord
  CONSOLES = ['Switch', 'PS4', 'Xbox One', 'PC']
  validates :title, presence: true
  validates :console, uniqueness: {
    scope: :title,
    message: "Cannot have multiples of a title on the same console"
  }, inclusion: {
    in: CONSOLES,
    message: "Not a valid console"
  }
  validates :description, presence: true
  validates :rating, presence: true

  has_many :listings, dependent: :destroy
end
