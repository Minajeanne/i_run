class Race < ApplicationRecord
  has_many :stats
  has_many :users, through: :stats
  before_validation :remove_empty_string

  def current_stat(current_user)
    self.stats.where(user: current_user).first
  end

  # def self.race_locations
  #   # self.reject { |l| l.to_s.empty? }
  #    # self.select{|location| location != nil}
  #   # binding.pry
  # end

  def self.remove_empty_string
    # self.reject! { |l| l.empty? }
    binding.pry
    self.location
  end
end
