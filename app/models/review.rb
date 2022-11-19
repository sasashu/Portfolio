class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :game#, primary_key: "jan"
  belongs_to :user

  validates :review_title, presence: true
  validates :review_comment, presence: true, length:{maximum:400}
  validates :rate, presence: true
end