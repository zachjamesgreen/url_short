# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Click.destroy_all
Link.destroy_all
User.destroy_all

user1 = User.create(name: 'user1', email: 'user1@example.com', password: 'asdfasdf')
user2 = User.create(name: 'user2', email: 'user2@example.com', password: 'asdfasdf')

Link.create!(title: 'Zach Green Codes', url: 'https://zachgreen.codes', user: user1, slug: 'testing')

FactoryBot.create_list(:link, 4, user: user1)
FactoryBot.create_list(:link, 5, user: user2)