# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by(email: 'user1@example.com') do |user|
  user.password_digest = Password.hashing('password')
end

Admin.find_or_create_by(email: 'admin1@example.com') do |admin|
  admin.password_digest = Password.hashing('password')
end
