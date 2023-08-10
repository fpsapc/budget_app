class Entity < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :group

  validates :name, presence: true, length: { maximum: 100 }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 100_000_000 }
  validates :user_id, presence: true


  validate :author_belongs_to_user

  private

  def author_belongs_to_user
    return if user_id == author_id

    errors.add(:author_id, 'must belong to the same user')
  end
end
