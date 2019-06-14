class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :user_prs
  has_many :stats
  has_many :races, through: :stats
end
