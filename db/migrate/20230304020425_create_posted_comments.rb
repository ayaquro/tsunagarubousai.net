class CreatePostedComments < ActiveRecord::Migration[6.1]
  def change
    create_table :posted_comments do |t|
      
      t.integer :post_id,null: false
      t.integer :general_user_id,null: false
      t.text :posted_comment,null: false

      t.timestamps
    end
  end
end
