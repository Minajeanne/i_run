class Location < ApplicationRecord
  has_many :race_locations
  has_many :races

end
