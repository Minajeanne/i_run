class Race < ApplicationRecord
  has_many :locations
  has_many :stats
  has_many :users, through: :stats
  accepts_nested_attributes_for :locations

  def current_stat(current_user)
    # binding.pry
    self.stats.where(user: current_user).first
  end

  def completion_status
    self.current_user.where(completion: true)
  end
end
