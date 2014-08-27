class Tweet < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :text, presence: true, length: { maximum: 150 }

  paginates_per 10
end
