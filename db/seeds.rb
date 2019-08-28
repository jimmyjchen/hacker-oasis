# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do
  user = User.create!(username: Faker::TvShows::GameOfThrones.character,
                      email: Faker::Internet.email,
                      password: '123456')
  p user

  rand(1..3).times do
    project = Project.new(name: Faker::Quote.robin,
                          description: Faker::Quote.yoda)
    project.user = user
    project.save!
    p project

    hacker_day = HackerDay.new(date: Faker::Date.forward,
                                   address: Faker::Address.full_address)
    hacker_day.project = project
    hacker_day.save!
    p hacker_day
  end
end

puts "added #{User.count} users, #{Project.count} projects, #{HackerDay.count} hackerdays"
