class Course < ApplicationRecord
  validates :title, :language, :level, :price, presence: true
  validates :description, length: { minimum: 10 }
  validates :short_description, length: { minimum: 5 }
  has_rich_text :description
  belongs_to :user

  scope :three, -> { limit(3) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Shows course object as title
  def to_s
    title
  end
end
