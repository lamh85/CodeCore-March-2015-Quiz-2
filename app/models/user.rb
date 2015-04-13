class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :comments

  has_many :memberships, dependent: :destroy
  # THROUGH RELATIONSHIPS TO USERS via MEMBERSHIPS
  has_many :joined_ideas, through: :memberships, source: :idea

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

end
