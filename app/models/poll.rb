class Poll < ApplicationRecord
  has_many :vote_options, dependent: :destroy
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true
  validates :topic, presence: true

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
