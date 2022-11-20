class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      
      t.string :title, null: false
      t.text :item_caption
      t.string :sales_date
      t.string :label
      t.string :jan
      t.text :item_url
      t.text :image_url
      
      t.timestamps
    end
  end
end

# テストの為, null: falseは外している
    # create_table :games, id: false do |t|
    # t.string :jan, null: false, primary_key: true
