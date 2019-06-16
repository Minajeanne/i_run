# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Race.create(name: "NYC Marathon", distance: "26.2", location: "New York, NY", event_date: "11-3-2019")
Race.create(name: "Boston Marathon", distance: "26.2", location: "Boston, MA", event_date: "04-20-2020")
Race.create(name: "Chicago Marathon", distance: "26.2", location: "Chicago, IL", event_date: "10-31-2019")

User.create(email: "pam@test.com", name: "Pam Reed")
User.create(email: "courtney@test.com", name: "Courtney Dauwalter")
User.create(email: "stevep@test.com", name: "Steve Prefontaine")
