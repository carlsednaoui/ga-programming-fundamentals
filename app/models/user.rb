class User < ActiveRecord::Base
  attr_accessible :fizzbuzz, :email, :name
  validates_presence_of :email, :name
end
