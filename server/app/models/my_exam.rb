class MyExam < ActiveRecord::Base
  attr_accessible :score, :time_cost, :user_id
  has_many :my_questions, :dependent => :destroy

  def self.all_belongs_to_user(user_id)
    where('user_id = ?', user_id)
  end

  def self.has_exam_for_user(user_id)
    all_belongs_to_user(user_id).count != 0
  end

  def self.latest_exam_for_user(user_id)
    all_belongs_to_user(user_id)[0]
  end

  def calculate_score  
    self.score = my_questions.reduce(0.0) do |mem, question|
       mem + score_of_question(question)     
    end
  end

  def total_seconds
    my_questions.count * seconds_each_question
  end

  def current_question_index
    my_questions.index { |question| question.user_post == nil }
  end

  def no_more_questions
    my_questions.count == 0 || my_questions.where(:user_post => nil).empty?
  end

  private

  def seconds_each_question
    5 * 60
  end

  def score_of_question(question)
    question.right? ? question_full_score : 0
  end

  def question_full_score
    100.0 / my_questions.count
  end


end
