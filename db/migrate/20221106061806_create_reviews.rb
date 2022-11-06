class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.string :review_title, null: false
      t.text :review_comment, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
