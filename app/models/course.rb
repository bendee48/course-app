class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :language, :level, :price, presence: true
  validates :description, length: { minimum: 10 }
  validates :short_description, length: { minimum: 5 }
  has_rich_text :description
  belongs_to :user

  scope :three, -> { limit(3) }

  # Shows course object as title
  def to_s
    title
  end

  LEVELS = %w[Beginner Intermediate Advanced].freeze
  def self.levels
    LEVELS
  end
end
