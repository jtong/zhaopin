class LogicExamController < ApplicationController
  before_filter :non_admin_authenticate
  include LogicExamHelper
  def index

  end

  def ing
    if(!MyExam.all_belongs_to_user(current_user.id)[0])
      @my_exam = MyExam.new
      @exam_paper = ExamPaper.last
      @my_exam.user_id = current_user.id
      @exam_paper.question_templates.each do |question|
        question_value = question.render
        my_question = MyQuestion.new
        my_question.name = question.name
        my_question.content = question_value[:content]
        my_question.answer = question_value[:answer]
        @my_exam.my_questions << my_question
      end
      @my_exam.save!
      record_begin_time
    else
      @my_exam = MyExam.all_belongs_to_user(current_user.id)[0]
    end
    @current_question_index = @my_exam.my_questions.index {|question| question.user_post == nil}
  end
end
