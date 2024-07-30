class User < ApplicationRecord


  attr_accessor  :update_pass
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  enum :role, { basic: 0, moderator: 1, admin: 2 }, suffix: true
  has_many :areas, dependent: :destroy


  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
