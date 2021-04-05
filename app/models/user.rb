class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :trackable, :confirmable
  has_many :courses
  rolify

  after_create :assign_default_role

  def assign_default_role
    if self.roles.blank?
      self.add_role(:student)
      self.add_role(:teacher)
    end
  end

  def to_s
    email
  end
end
