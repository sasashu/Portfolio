class GameTag < ApplicationRecord
  belongs_to :game#, primary_key: "jan"
  belongs_to :tag
end