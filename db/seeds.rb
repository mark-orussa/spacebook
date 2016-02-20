# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

# This adds the default values to the

post_attributes = [
    { display: "Only Me", description: "Only I can see this." },
    { display: "Friends", description: "Only my friends can see this." },
    { display: "Public", description: "Anyone can see this." },
]

post_attributes.each do |attributes|
  PrivacyLevel.where(attributes).first_or_create
end

=begin
10.times do
  a = Galaxy.create(
      author: "slvspur88@gmail.com",
      content: Lorem.paragraph(2, false, 4),
      image: Placeholdit.image("50x50", 'jpg'),
      tag: ""
  )
  puts a.inspect
=end