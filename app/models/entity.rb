class Entity < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
  validates :user_id, presence: true

  belongs_to :user, foreign_key: :author_id
  belongs_to :group

  validate :author_belongs_to_user

  private

  def author_belongs_to_user
    return if user_id == author_id

    errors.add(:author_id, 'must belong to the same user')
  end
end
