class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  # 必要以上に文字数を多くさせすぎない為に最大文字数を設定。
  validates :comment, presence: true, length:{maximum:200}
end