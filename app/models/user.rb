class User < ActiveRecord::Base
  attr_accessible :answer, :email, :name
end
