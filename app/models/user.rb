class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_prs
  has_many :stats
  has_many :races, through: :stats

  def completion_status
    self.races.includes(:stats).where('stats.completion = true')
  end
end
