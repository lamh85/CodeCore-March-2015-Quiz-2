class Idea < ActiveRecord::Base

  validates :body, presence: {message: "must be entered"}
  validates :title, presence: {message: "must be entered"}

  has_many :comments, dependent: :nullify

  has_many :memberships, dependent: :nullify
  # THROUGH RELATIONSHIPS TO USERS via MEMBERSHIPS
  has_many :members, through: :memberships, source: :user

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  belongs_to :user, dependent: :destroy

end