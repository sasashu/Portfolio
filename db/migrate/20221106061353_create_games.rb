class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      
      t.string :title, null: false
      t.text :item_caption, null: false
      t.string :sales_date, null: false
      t.string :label, null: false
      t.string :jan, null: false
      t.text :item_url, null: false
      t.text :image_url, null: false
      
      t.timestamps
    end
  end
end

# テストの為, null: falseは外している
    # create_table :games, id: false do |t|
    # t.string :jan, null: false, primary_key: true
