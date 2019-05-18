class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_prs
  has_many :stats
  has_many :races, through: :stats
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  

  def race_complete
    self.races.includes(:stats).where('stats.completion = true')
  end

  def race_incomplete
    self.races.includes(:stats).where('stats.completion = false')
  end
end
