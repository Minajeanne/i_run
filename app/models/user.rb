class User < ApplicationRecord
  has_many :user_prs
  has_many :stats
  has_many :races, through: :stats

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  validates :email, uniqueness: true
  validates :email, confirmation: {case_sensitive: false}
  validates :password, confirmation: {case_sensitive: true}
  validates :password, length: { minimum: 6}
  validates :email, :password, :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name  #change first_name/last_name to name in user table
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  def race_complete
    self.races.includes(:stats).where('stats.completion = true')
  end

  def race_incomplete
    self.races.includes(:stats).where('stats.completion = false')
  end

  def first_name
    name.split.first
  end

  def last_name
   name.split.last
  end
end
