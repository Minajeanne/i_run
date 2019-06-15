class StatSerializer < ActiveModel::Serializer
  attributes :id, :completion

  belongs_to :user
  belongs_to :race
end
