class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_tags do |t|
      
      t.integer :game_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
