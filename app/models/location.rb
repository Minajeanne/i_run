class Location < ApplicationRecord
  has_many :race_locations
  has_many :races, through: :race_locations

end
