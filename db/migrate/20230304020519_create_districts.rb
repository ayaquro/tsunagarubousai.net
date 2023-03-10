# frozen_string_literal: true

class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :district_name, null: false

      t.timestamps
    end
  end
end
