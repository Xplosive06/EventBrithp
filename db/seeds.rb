# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
	user = User.create!(first_name: Faker::GreekPhilosophers.name, last_name: Faker::Name.last_name, encrypted_password: Faker::Internet.password, description: Faker::ChuckNorris.fact, email: Faker::Internet.free_email)
end

puts "USER CREATED !!!!!!!!!!!!!!!!!!!!!!"

10.times do
	event = Event.create!(start_date: Date.today, duration: rand(2..100)*5, title: Faker::StarTrek.location, description: Faker::Shakespeare.hamlet_quote*2, location: Faker::Address.city, price: rand(1..1000), administrator_id: User.all.ids.sample)
end

puts "EVENT CREATED $$$$$$$$$$$$$$$$$$$$$$$$"


10.times do
	attendance = Attendance.create!(stripe_customer_id: rand(100..1000)*2, attendee_id: User.all.ids.sample, event_id: Event.all.ids.sample)
end

puts "ATTENDANCE CREATED 33333333333333333333333333333"