class MyExam < ActiveRecord::Base
  attr_accessible :score, :time_cost, :user_id
  has_many :my_questions, :dependent => :destroy

  def self.all_belongs_to_user(user_id)
    where('user_id = ?', user_id)
  end
end
