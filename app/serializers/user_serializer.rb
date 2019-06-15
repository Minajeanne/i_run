class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :user_prs
  has_many :stats
  has_many :races, through: :stats
end
