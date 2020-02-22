# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w[Python Ruby PHP HTML Go Java Scala]
names.each do |name|
  StudyLanguage.create!(name: name)
end

10.times.each do |n|
  User.create(email: "#{n}@gmail.com", password: "password", name: "Sample 00#{n}")
end

User.all.each do |user|
  user.schedules.create!(title: "Sample schedule created by #{user.name}", starttime: Time.zone.now - 1.hour, endtime: Time.zone.now, study_language_id: 1)
end

User.create!(email: 'admin@gmail.com', password: 123456, role: 'admin', name: 'admin')

tags = %w[Python React Vue Firebase AWS Docker Ruby on Rails PHP Laravel]
tags.each do |tag|
  Tag.create!(name: tag)
end