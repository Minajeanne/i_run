class UserPrSerializer < ActiveModel::Serializer
  attributes :user_id, :name, :description
  belongs_to :user
end
