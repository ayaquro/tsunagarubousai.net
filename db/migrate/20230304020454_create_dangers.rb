# frozen_string_literal: true

class CreateDangers < ActiveRecord::Migration[6.1]
  def change
    create_table :dangers do |t|
      t.integer :general_user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
