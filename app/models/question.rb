class Question < ActiveRecord::Base

  attr_accessible :title, :text

  belongs_to :user
  has_many :responses, :as => :respondable, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :votes, :as => :voteable, :dependent => :destroy

end
