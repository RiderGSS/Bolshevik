class Poll < ApplicationRecord
  has_many :vote_options, dependent: :destroy
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true
  validates :topic, presence: true

  def self.colours
    ["bg-green-600" ,"bg-rose-600" ,"bg-blue-500" ]
  end
   def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def votes_summary
    vote_options.inject(0) {|summary, option| summary + option.votes.count}
  end

end


