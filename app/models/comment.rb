class Comment < ActiveRecord::Base
  validates :body, presence: {message: "must be entered"}


  belongs_to :user
  belongs_to :idea


end
