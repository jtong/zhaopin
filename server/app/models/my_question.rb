class MyQuestion < ActiveRecord::Base
  belongs_to :my_exam
  attr_accessible :answer, :content, :name, :user_post
end
