class Race < ApplicationRecord
  has_many :locations
  has_many :stats
  has_many :users, through: :stats
  accepts_nested_attributes_for :locations
end
