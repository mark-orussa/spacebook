# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

10.times do
  a = Galaxy.create(
      author: "slvspur88@gmail.com",
      content: Lorem.paragraph(2, false, 4),
      image: Placeholdit.image("50x50", 'jpg'),
      tag: ""
  )
  puts a.inspect

end