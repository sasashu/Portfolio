# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: ENV['ADMIN_MAIL'],
   password: ENV['ADMIN_PASSWORD']
)
Tag.create([
  { name: 'PC' },
  { name: 'PS4/PS5' },
  { name: 'Switch' },
  { name: '携帯ゲーム' },
  { name: 'その他' },
  { name: 'RPG' },
  { name: 'アクション' },
  { name: 'アドベンチャー' },
  { name: 'シミュレーション' },
  { name: 'シューティング' },
  { name: 'パズル' },
  { name: 'レース' },
  { name: 'スポーツ' },
])