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
    {last_name: '安全', first_name: 'マチ子', kana_last_name: 'アンゼン', kana_first_name: 'マチコ', email: 'anzen@machiko', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userw3.jpg"), filename:"sample-userw3.jpg")},
    {last_name: '安全', first_name: '美暮', kana_last_name: 'アンゼン', kana_first_name: 'ミク', email: 'anzen@miku', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userw4.jpg"), filename:"sample-userw4.jpg")},
    {last_name: '地域', first_name: '守', kana_last_name: 'チイキ', kana_first_name: 'マモル', email: 'chiiki@mamoru', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userm1.jpg"), filename:"sample-userm1.jpg")},
    {last_name: '地域', first_name: '守朗', kana_last_name: 'チイキ', kana_first_name: 'マモロウ', email: 'chiiki@mamorou', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userm2.jpg"), filename:"sample-userm2.jpg")},
    {last_name: '自然', first_name: '共生', kana_last_name: 'シゼン', kana_first_name: 'トモキ', email: 'shizen@tomoki', password: 'bousai', is_deleted: "false", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-userm3.jpg"), filename:"sample-userm3.jpg")}
  ]
  )

#5.times do |n|
  #District.create!(
    #district_name: "福島#{n+1}",
  #)
districts=District.create!(
  [
    {district_name: '東部'},
    {district_name: '西部'},
    {district_name: '南部'},
    {district_name: '北部'},
    {district_name: '太平洋側'},
    {district_name: '日本海側'},
    {district_name: '山間部'}
  ]
  )

posts=Post.create!(
  [
    {posted_title: '山崩れ', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/山崩れ.jpg"), filename:"山崩れ.jpg"), posted_text: '山が崩れています。', general_user_id: general_users[0].id, district_id: districts[0].id },
    {posted_title: '土砂崩れ', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/土砂崩れ.jpg"), filename:"土砂崩れ.jpg"), posted_text: '土砂崩れが起きています。', general_user_id: general_users[1].id, district_id: districts[1].id },
    {posted_title: '法面崩壊', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/法面崩壊.jpg"), filename:"法面崩壊.jpg"), posted_text: '法面が崩壊して通行できなくなっています。', general_user_id: general_users[2].id, district_id: districts[2].id },
    {posted_title: '壊れそうな石垣', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/石垣.jpg"), filename:"石垣.jpg"), posted_text: '所々割れているところがあり危ないです。', general_user_id: general_users[3].id, district_id: districts[3].id },
    {posted_title: '道路の隆起', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/道路の隆起.jpg"), filename:"道路の隆起.jpg"), posted_text: '道路が隆起して、通れません。', general_user_id: general_users[4].id, district_id: districts[0].id },
    {posted_title: '台風で倒れた木', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/台風で倒れた木.jpg"), filename:"台風で倒れた木.jpg"), posted_text: '昨日の台風で倒れたようです。', general_user_id: general_users[5].id, district_id: districts[1].id },
    {posted_title: '台風による増水', posted_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/台風による増水.jpg"), filename:"台風による増水.jpg"), posted_text: '川が増水しています。', general_user_id: general_users[6].id, district_id: districts[2].id }
  ]
  )

PostedComment.create!(
  [
    {posted_comment: '日中に避難した方がよさそうです。', general_user_id: general_users[0].id, post_id: posts[6].id },
    {posted_comment: '近くの方は避難したようです。',  general_user_id: general_users[1].id, post_id: posts[0].id },
    {posted_comment: '近づかないようにコーンを置いています。',general_user_id: general_users[2].id, post_id: posts[1].id },
    {posted_comment: 'いつも使っている道なので早急に対応してほしいです。',general_user_id: general_users[3].id, post_id: posts[2].id },
    {posted_comment: '子供の通学路になっているので心配です。',general_user_id: general_users[4].id, post_id: posts[3].id },
    {posted_comment: 'この先の集落が孤立化しています。',general_user_id: general_users[5].id, post_id: posts[4].id },
    {posted_comment: '危ないので早く撤去してほしいです。',general_user_id: general_users[6].id, post_id: posts[5].id }
  ]
)