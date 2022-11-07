class Game < ApplicationRecord
  has_many :tags, through: :game_tags, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence:true
  validates :introduction, presence:true
  validates :release, presence:true
end
