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
    self.where("location <> ''") || self.where("name <> ''") || self.where("distance <> ''")
  end
end
