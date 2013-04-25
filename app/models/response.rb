class Response < ActiveRecord::Base
  attr_accessible :text

  belongs_to :respondable, :polymorphic => true
  belongs_to :user
end
