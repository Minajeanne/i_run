class RaceLocation < ApplicationRecord
  belongs_to :location
  belongs_to :race
end
