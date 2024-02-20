require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#Create users
20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@yopmail.com"
  
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: 'password',
    description: Faker::Books::Dune.quote)
end
puts "20 users have been created"

#Create events
city = "Marseille"
50.times do
  Event.create(
    title: Faker::Lorem.word,
    start_date: Faker::Time.forward(days: 30, period: :day),
    duration: 5 * rand(1..60),
    description: Faker::Lorem.sentence,
    price: rand(1..1000),
    location: city,
    admin: User.all.sample
  )
end
puts "50 events have been created"