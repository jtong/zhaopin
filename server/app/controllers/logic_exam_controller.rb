class LogicExamController < ApplicationController
  before_filter :non_admin_authenticate
  include LogicExamHelper
  def index

  end

  def ing
    unless MyExam.has_exam_for_user(current_user.id)
      @my_exam = ExamPaper.create_exam_for_user(current_user.id)
      record_time_for_exam(@my_exam)
    else
      @my_exam = MyExam.latest_exam_for_user(current_user.id)
    end

    if no_time || @my_exam.no_more_questions
      @my_exam.calculate_score
      @my_exam.time_cost = passed_seconds
      @my_exam.save!
      redirect_to "/logic_exam", :flash => { :score => @my_exam.score }
    else
      gon.start_time_in_sec = start_time.to_i
      gon.left_seconds = left_seconds
    end
  end

  def answer
    question = MyQuestion.find_by_id(params[:question_id])
    question.user_post = params[:user_post]
    question.save!
    redirect_to :action => 'ing'
  end

  private

  def record_time_for_exam(my_exam)
    record_begin_time
    record_total_seconds my_exam.total_seconds
  end

  def no_time
    left_seconds <= 0
  end

  def passed_seconds
    (Time.now - start_time).round
  end

  def left_seconds
    total_seconds - passed_seconds
  end
end
