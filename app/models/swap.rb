class Swap < ApplicationRecord
  belongs_to :listing_requested, class_name: :Listing
  belongs_to :listing_offered, class_name: :Listing
  # validates :listing_offered, :listing_requested, :status, :offered_recieved, :requested_recieved, presence: true
end
