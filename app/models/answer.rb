class Answer < ActiveRecord::Base
  attr_accessible :text, :vote_count

  validates :text, :user_id, :question_id, :presence => true

  belongs_to :question
  has_many :responses, :as => :respondable, :dependent => :destroy
  has_many :votes, :as => :voteable, :dependent => :destroy
  belongs_to :user

end
