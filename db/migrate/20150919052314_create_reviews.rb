class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
    add_index :reviews, [:restaurant_id, :user_id], unique: true
  end
end
