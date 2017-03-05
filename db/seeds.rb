# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'aadmin', password: 'user1234', email: 'aadmin@example.com', roles: [Role.find(1)])
User.create(username: 'PM1', password: 'user1234', email: 'pm1@example.com', roles: [Role.find(2)])
User.create(username: 'PM2', password: 'user1234', email: 'pm2@example.com', roles: [Role.find(2)])
User.create(username: 'CM1', password: 'user1234', email: 'cm1@example.com', roles: [Role.find(3)])
User.create(username: 'CM1', password: 'user1234', email: 'cm1@example.com', roles: [Role.find(3)])
User.create(username: 'CC2', password: 'user1234', email: 'cc2@example.com', roles: [Role.find(4)])
User.create(username: 'I1', password: 'user1234', email: 'i1@example.com', roles: [Role.find(5)])
User.create(username: 'I2', password: 'user1234', email: 'i1@example.com', roles: [Role.find(5)])