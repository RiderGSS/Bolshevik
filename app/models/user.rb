class User < ApplicationRecord


  attr_accessor  :update_pass
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  enum :role, { user: 0, moderator: 1, admin: 2 }, suffix: true
  has_many :areas, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :vote_options, through: :votes


  def voted_for?(poll)
    vote_options.any? {|v| v.poll == poll }
  end
  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
