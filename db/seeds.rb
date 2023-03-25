# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Staff.create!(
  email: 'kanri@bousai.com',
  password: 'bousai',
  )

general_users=GeneralUser.create!(
  [
    {last_name: '防災', first_name: '守子', kana_last_name: 'ボウサイ', kana_first_name: 'マコ', email: 'bousai@mako', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userw1.jpg"), filename:"sample-userw1.jpg")},
    {last_name: '防災', first_name: '守美', kana_last_name: 'ボウサイ', kana_first_name: 'マミ', email: 'bousai@mami', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userw2.jpg"), filename:"sample-userw2.jpg")},
    {last_name: '地域', first_name: '守', kana_last_name: 'チイキ', kana_first_name: 'マモル', email: 'chiiki@mamoru', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userm1.jpg"), filename:"sample-userm1.jpg")},
    {last_name: '地域', first_name: '守朗', kana_last_name: 'チイキ', kana_first_name: 'マモロウ', email: 'chiiki@mamorou', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userm2.jpg"), filename:"sample-userm2.jpg")}
  ]
  )

5.times do |n|
  District.create!(
    district_name: "福島#{n+1}",
  )
end