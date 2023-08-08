class User < ApplicationRecord
  has_many :groups
  has_many :entities, foreign_key: :author_id
end
