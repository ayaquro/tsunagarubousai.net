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

GeneralUser.create!(
  [
    {last_name: '防災', first_name: '守子', kana_last_name: 'ボウサイ', kana_first_name: 'マコ', email: 'bousai@mako', encrypted_password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userw1.jpg"), filename:"sample-userw1.jpg")},
  ]
  )

5.times do |n|
  District.create!(
    district_name: '福島#{n+1}',
  )
end