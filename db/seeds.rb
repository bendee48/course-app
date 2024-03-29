# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create!(email: 'ben@email.com', password: 'password')
user1.confirm
user1.add_role(:admin)
user2 = User.create!(email: 'emma@email.com', password: 'password')
user2.confirm
user3 = User.create!(email: 'rob@email.com', password: 'password')


Course.destroy_all
15.times do
  Course.create!(title: Faker::Educator.course_name, 
                 description: Faker::Lorem.paragraphs.join,
                 short_description: Faker::Lorem.sentences(number: 2).join,
                 language: Faker::Nation.language,
                 level: 'Beginner',
                 price: Faker::Number.decimal(l_digits: 2),
                 user_id: user1.id)
  Course.create!(title: Faker::Educator.course_name,
                 description: Faker::Lorem.paragraphs.join,
                 short_description: Faker::Lorem.sentences(number: 2).join,
                 language: Faker::Nation.language,
                 level: 'Intermediate',
                 price: Faker::Number.decimal(l_digits: 2),
                 user_id: user2.id)
end

puts "#{User.count} user#{'s' if User.count > 1} created. #{Course.count} courses created."