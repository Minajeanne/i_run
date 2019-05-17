class Race < ApplicationRecord
  has_many :stats
  has_many :users, through: :stats
  accepts_nested_attributes_for :locations

  def current_stat(current_user)
    self.stats.where(user: current_user).first
  end

  def self.race_locations
    self.reject { |l| l.to_s.empty? }
    # self.select{|location| location != nil}
    binding.pry
  end
end
