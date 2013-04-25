class Answer < ActiveRecord::Base

  belongs_to :question
  has_many :responses, :as => :respondable
  has_many :votes, :as => :voteable
  belongs_to :user

end
