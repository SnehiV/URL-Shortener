# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'hello')
ShortenedUrl.create!(long_url: 'yoooo', short_url: 'ayyyyy', user_id: 1)
Visit.create!(user_id: 1, short_id: 1)
