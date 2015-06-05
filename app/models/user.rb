class User < ActiveRecord::Base
  has_secure_password
  has_many :question
  has_many :answer

end
