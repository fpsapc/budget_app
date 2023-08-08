class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  validates :user_id, presence: true

  belongs_to :user

  has_many :entities, dependent: :destroy
end
