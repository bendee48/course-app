# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.destroy_all

30.times do
  Course.create!(title: Faker::Educator.course_name, description: Faker::Lorem.paragraphs.join) 
end

User.destroy_all
User.create!(email: 'ben@email.com', password: 'password')

puts "#{Course.count} courses created. #{User.count} user#{'s' if User.count > 1} created"