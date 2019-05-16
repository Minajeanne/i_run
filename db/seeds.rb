# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
race1 = Race.create(name: "NYC Marathon")
race2 = Race.create(name: "Boston Marathon")
race3 = Race.create(name: "Chicago Marathon")

location1 = Location.create(name: "New York, NY")
location2 = Location.create(name: "Boston, MA")
location3 = Location.create(name: "Chicago, IL")
