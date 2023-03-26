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

#5.times do |n|
  #District.create!(
    #district_name: "福島#{n+1}",
  #)
districts=District.create!(
  [
    {district_name: '会津'},
    {district_name: '福島'},
    {district_name: '郡山'},
    {district_name: 'いわき'}
  ]
  )

posts=Post.create!(
  [
    {posted_title: '山崩れ', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/山崩れ.jpg"), filename:"山崩れ.jpg"), posted_text: '山が崩れています。', general_user_id: general_users[0].id, district_id: districts[0].id },
    {posted_title: '土砂崩れ', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/土砂崩れ.jpg"), filename:"土砂崩れ.jpg"), posted_text: '土砂崩れが起きています。', general_user_id: general_users[1].id, district_id: districts[1].id  },
    {posted_title: '法面崩壊', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/法面崩壊.jpg"), filename:"法面崩壊.jpg"), posted_text: '法面が崩壊して通行できなくなっています。', general_user_id: general_users[2].id, district_id: districts[2].id  }
  ]
  )

PostedComment.create!(
  [
    {posted_comment: '危険ですね。', general_user_id: general_users[0].id, post_id: posts[2].id },
    {posted_comment: '早く直してほしいです。',  general_user_id: general_users[1].id, post_id: posts[0].id },
    {posted_comment: 'いつも使う道なので早急に対応してほしいです。',general_user_id: general_users[2].id, post_id: posts[1].id }
  ]
)