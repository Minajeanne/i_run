class RaceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :event_date, :distance, :location, :finish_time

  has_many :stats
  has_many :users, through: :stats
end
