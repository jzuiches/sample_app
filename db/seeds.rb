# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password,activated: true, activated_at: Time.zone.now)
end


training_type = ["Beacon & Recco", "Lift Evac", "Rope Rescue", "Avalanche Routes", "Funitel Evac", "Toboggan", "Dog Training", "Misc."]
training_type.each do |t|
  TrainingDivision.create!(training_type: t )
end

users = User.order(:created_at).take(6)
10.times do
  training_division = TrainingDivision.all.sample
  location = Faker::Address.street_name
  training_date = Faker::Date.backward(21)
  trainer = Faker::Name.first_name
  users.each { |user| user.trainings.create!(training_division_id: training_division.id, location: location, training_date: training_date, trainer: trainer) }
end