# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
  User.create(username: Faker::Name.last_name, password: "123456")
end
5.times do
  Sub.create(title: Faker::Pokemon.name, description: "Home of #{Faker::Witcher.school} with plenty of #{Faker::Witcher.monster}", moderator_id: (1..20).to_a.sample)
end
10.times do
  Post.create(title: Faker::University.name, url: Faker::OnePiece.akuma_no_mi, content: Faker::MostInterestingManInTheWorld.quote, sub_id: (1..30).to_a.sample, author_id: (1..20).to_a.sample, sub_ids: [1,2,3])
end
