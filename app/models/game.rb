class Game < ApplicationRecord
  include PgSearch::Model
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

  pg_search_scope :search_by_title_description_console_and_rating,
    against: [:title, :description, :console, :rating],
    using: {
      tsearch: { prefix: true }
    }
end
