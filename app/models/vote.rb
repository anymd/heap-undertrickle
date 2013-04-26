class Vote < ActiveRecord::Base
  attr_accessible :vote, :user

  belongs_to :voteable, :polymorphic => true
  belongs_to :user
end
