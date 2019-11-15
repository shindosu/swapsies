class WishlistItem < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :user, :game, :condition, presence: true
  validates :user, uniqueness: {
    scope: :game,
    message: "Cannot wish for the same game multiple times"
  }
end
