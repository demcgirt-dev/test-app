# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  [ "Dave Mac", "david@jcwproductions.com", "password" ],
  [ "Nicole Slack", "nicole@jcwproductions.com", "password" ],
  [ "Nola Bunnies", "nola@jcwproductions.com", "password" ]
]

users.each do |user|
  User.create( :username => user[0], :email => user[1], :password => user[2] )
end