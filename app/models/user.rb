class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :questions
  has_many :votes
  has_many :responses
  has_many :answers


end
