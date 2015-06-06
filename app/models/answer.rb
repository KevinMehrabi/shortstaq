class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question  
  validates :body, length: {maximum: 200}
end
