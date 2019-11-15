class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :listings
  has_many :wishlist_items

  # has_many :offered_swaps, through: :listings, foreign_key: :listing_offered, source: :swaps
  validates :first_name, :last_name, :username, :city, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9.]+@[a-z]+\.[a-z]{2,3}\z/i }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :requested_swaps, through: :listings, foreign_key: 'listing_requested', class_name: 'Swap'
end
