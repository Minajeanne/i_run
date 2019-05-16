class Race < ApplicationRecord
  has_many :race_locations
  has_many :locations, through: :race_locations
  has_many :stats
  has_many :users, through: :stats
  accepts_nested_attributes_for :locations
end
