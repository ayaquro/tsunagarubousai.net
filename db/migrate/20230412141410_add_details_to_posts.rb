class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :lat, :float, null: false
    add_column :posts, :lng, :float, null: false
  end
end
