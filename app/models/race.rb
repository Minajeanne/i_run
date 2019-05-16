class Race < ApplicationRecord
  has_many :locations
  has_many :stats
  has_many :users, through: :stats
  accepts_nested_attributes_for :locations

  def current_stat(current_user)
    self.stats.where(user: current_user)
  end
end
