class StatSerializer < ActiveModel::Serializer
  attributes :id, :completion, :finish_time

  belongs_to :user
  belongs_to :race
end
