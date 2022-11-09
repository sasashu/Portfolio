class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags, dependent: :destroy

  validates :title, presence:true
  validates :introduction, presence:true
  validates :release, presence:true
  
  def self.search(keyword)
    if search
      Game.where(['name LIKE ?', "%#{keyword}%"])
    else
      Game.all
    end
  end
end
