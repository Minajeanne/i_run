class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_date, :distance, :location

  has_many :stats
  has_many :users, through: :stats
end
