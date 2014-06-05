class ExamPaper < ActiveRecord::Base
  attr_accessible :name
  has_many :question_of_exam_papers
  has_many :question_templates, :through => :question_of_exam_papers

  def self.create_exam_for_user(user_id)
    my_exam = MyExam.new
    latest_paper = self.last

    latest_paper.question_templates.each do |question|
      question_value = question.render
      my_question = MyQuestion.new
      my_question.name = question.name
      my_question.content = question_value[:content]
      my_question.answer = question_value[:answer]
      my_question.answer_verify_type = question_value[:answer_verify_type]
      my_exam.my_questions << my_question
    end
    my_exam.user_id = user_id
    my_exam.save!
    my_exam
  end

end

