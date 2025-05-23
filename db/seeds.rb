# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'factory_bot_rails'
require 'faker'

puts 'Creating Default User.'
# FactoryBot.create(:user)
User.create(
    first_name: "Tia",
    last_name: "Widi",
    email: "tiawidi@mail.com",
    password: 'password'
  )


puts 'Creating Dummy User.'
10.times do 
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

puts 'Creating Dummy Project.'
10.times do 
  project = Project.create(
    name: Faker::Appliance.brand,
    status: 'Not Started'
  )

  project.change_status(User.all.sample, 'In Progress')
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.change_status(User.all.sample, 'On Hold')
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.change_status(User.all.sample, 'In Progress')
  project.add_comment(User.all.sample, Faker::Marketing.buzzwords)
  project.change_status(User.all.sample, 'Completed')
end