class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  enum :role, { basic: 0, moderator: 1, admin: 2 }, suffix: true


  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
