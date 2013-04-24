class Question < ActiveRecord::Base

  attr_accessible :title, :text

  belongs_to :user
  has_many :responses, :as => :respondable
  has_many :answers
  has_many :votes, :as => :voteable

end
