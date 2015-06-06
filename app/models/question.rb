class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :title, length: {maximum: 50}  
  validates :body, length: {maximum: 200}
end
