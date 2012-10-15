class User < ActiveRecord::Base
  attr_accessible :answer, :email, :name
  validates_presence_of :email, :name
end
