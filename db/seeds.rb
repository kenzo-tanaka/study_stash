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

tags = %w[Python React Vue Firebase AWS Docker Ruby PHP Laravel]
tags.each do |tag|
  Tag.create!(name: tag)
end

10.times.each do |n|
  User.create(email: "sample00#{n}@gmail.com", password: "password", name: "Sample 00#{n}")
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

Portfolio.create(
  url: 'https://productstashme.herokuapp.com/',
  ogp_url: 'https://user-images.githubusercontent.com/33926355/75641252-f1294280-5c7a-11ea-947b-61fc2204cd0e.png',
  description: '素敵なサービスを見つけられるWebサイト',
  title: 'Product Stash'
)

Portfolio.create!(
  url: 'https://ikeatsu-works.herokuapp.com/#1',
  ogp_url: 'https://ikeatsu-works.s3-ap-northeast-1.amazonaws.com/ikeatsu-works-twitter-card.jpg',
  description: '池田篤士のポートフォリオサイト',
  title: '池田篤士のポートフォリオサイト'
)

Portfolio.create!(
  url: 'https://supplebox.jp/',
  ogp_url: 'https://user-images.githubusercontent.com/33926355/75110146-ad787c80-566d-11ea-9057-8a53f5a24bc4.png',
  description: 'プロテインサービス',
  title: 'SuppleBox'
)


titles = ["Webを支える技術", "リーダブルコード ―より良いコードを書くためのシンプルで実践的なテクニック (Theory in practice) ", "オブジェクト指向でなぜつくるのか", "新装版 達人プログラマー 職人から名匠への道", "新しいLinuxの教科書", "なっとく！アルゴリズム Kindle版", "オブジェクト指向設計実践ガイド　～Rubyでわかる 進化しつづける柔軟なアプリケーションの育て方", "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで (Software Design plusシリーズ) "]
urls = ["https://amzn.to/2wKfvq5", "https://amzn.to/2HMeYpN", "https://amzn.to/3c0OGhi", "https://amzn.to/32xX8QS", "https://amzn.to/2vlzPxw", "https://amzn.to/3c7Nf0J", "https://amzn.to/397UQum", "https://amzn.to/2vapggE"]
image_urls = ["https://images-na.ssl-images-amazon.com/images/I/51qo6pgjaSL._SX356_BO1,204,203,200_.jpg", "https://images-na.ssl-images-amazon.com/images/I/51MgH8Jmr3L._SX352_BO1,204,203,200_.jpg", "https://images-na.ssl-images-amazon.com/images/I/51s3936d%2BkL._SX364_BO1,204,203,200_.jpg", "https://images-na.ssl-images-amazon.com/images/I/51aDNpMj8hL._SX350_BO1,204,203,200_.jpg", "https://images-fe.ssl-images-amazon.com/images/I/51h3XbUE5EL.jpg", "https://images-fe.ssl-images-amazon.com/images/I/61bXMHbyv3L.jpg", "https://images-fe.ssl-images-amazon.com/images/I/5112hfXmhtL.jpg", "https://images-na.ssl-images-amazon.com/images/I/51nY-YLt2ZL._SX395_BO1,204,203,200_.jpg"]


titles.length.times.each do |n|
  Book.create!(
    title: titles[n],
    url: urls[n],
    image_url: image_urls[n]
  )
end