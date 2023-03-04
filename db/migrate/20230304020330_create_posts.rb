class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :general_user_id,null: false
      t.integer :district_id,null: false
      t.integer :posted_title,null: false
      t.text :posted_text,null: false

      t.timestamps
    end
  end
end