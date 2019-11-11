class Listing < ApplicationRecord
  CONDITIONS = ['new', 'like new', 'good', 'acceptable']
  belongs_to :user
  belongs_to :game
  validates :user, :game, :condition, presence: true
  validates :condition, inclusion: {
    in: CONDITIONS,
    message: "Not a valid condition"
  }
end
