class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|

      t.string :email,null: false
      t.string :encrypted_password,null: false

      t.timestamps
    end
  end
end