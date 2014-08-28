class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :following_to, class_name: "Following", foreign_key: "from_id", dependent: :destroy
  has_many :followings, through: :following_to, source: :to
  has_many :followed_from, class_name: "Following", foreign_key: "to_id", dependent: :destroy
  has_many :followers, through: :followed_from, source: :from
end
