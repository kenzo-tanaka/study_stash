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
User.create!(email: 'admin@gmail.com', password: 123456, role: 'admin', name: 'admin')

User.all.each do |user|
  user.schedules.create!(title: "Sample schedule created by #{user.name}", starttime: Time.zone.now - 1.hour, endtime: Time.zone.now, study_language_id: 1)
  Blog.create(title: "Blog by #{user.name}", user: user)
end

Blog.all.each do |blog|
  10.times.each do |n|
    Article.create(
      title: "Sample article created by #{blog.user.name} No.00#{n}",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      thumbnail_url: "https://dzcs2xt7u3fop.cloudfront.net/assets/ogp_default-1419eb25f5902ee7c2d240e4e85b49e180fb5fd21cd8d2467b5b42e94e096429.png",
      blog: blog
    )
  end
end


tags = %w[Python React Vue Firebase AWS Docker Ruby PHP Laravel]
tags.each do |tag|
  Tag.create!(name: tag)
end
