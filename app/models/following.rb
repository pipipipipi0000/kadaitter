class Following < ActiveRecord::Base
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"

  validates :from_id, presence: true, uniqueness: { scope: :to }
  validates :to_id, presence: true
end
