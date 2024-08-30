# frozen_string_literal: true

class Area< ApplicationRecord
  belongs_to :user
  #has_many :payments
  #has_many :indications
  validates :area,:name,:kadastr,:surname,:address_area,  presence: true
  validates_uniqueness_of :user_id

end
