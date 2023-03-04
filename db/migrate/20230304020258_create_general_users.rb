class CreateGeneralUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :general_users do |t|

      t.string :last_name,null: false
      t.string :first_name,null: false
      t.string :kana_last_name,null: false
      t.string :kana_first_name,null: false
      t.string :email,null: false
      t.string :encrypted_password,null: false
      t.integer :registration_status,null: false,default: 0

      t.timestamps
    end
  end
end
