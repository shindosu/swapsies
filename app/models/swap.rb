class Swap < ApplicationRecord
  belongs_to :listing_requested, class_name: "Listing"
  belongs_to :listing_offered, class_name: "Listing"
end
