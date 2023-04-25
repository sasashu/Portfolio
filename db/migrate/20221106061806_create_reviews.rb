class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.integer :review_id
      t.string :review_title, null: false
      t.text :review_comment, null: false
      t.integer :rate, null: false

      t.timestamps
    end
  end
end

# コメントに情報を送るためにt.integer :review_idを追加で作成しました。