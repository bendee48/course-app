class Course < ApplicationRecord
  validates :title, presence: true
  validates :description, length: { minimum: 5 }

  # Shows course object as title
  def to_s
    title
  end
end
