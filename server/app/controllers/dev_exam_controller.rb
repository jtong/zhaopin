class DevExamController < ApplicationController
  before_filter :non_admin_authenticate
  def current_step
    @my_current_step_in_first_exam = MyCurrentStepInFirstExam.find_by_user_id current_user.id
    if(!@my_current_step_in_first_exam)
      @my_current_step_in_first_exam = MyCurrentStepInFirstExam.new
      @my_current_step_in_first_exam.step="logic_exam"
      @my_current_step_in_first_exam.step_num=1
      @my_current_step_in_first_exam.user = current_user
      @my_current_step_in_first_exam.save!
    end

    if(@my_current_step_in_first_exam.step == "logic_exam")
      redirect_to :controller => :logic_exam, :action => :index
    else
     redirect_to action: @my_current_step_in_first_exam.step
    end


  end

  def kata
    @current_steps = 2
    @katas = Kata.all
    @my_posted_kata = MyPostedKata.find_by_user_id current_user.id

    set_current_step "kata", 2
  end

  def choose_a_kata
    @current_steps = 2
    @kata = Kata.find params[:id]
    @my_posted_kata = MyPostedKata.new ({
      kata: @kata,
      user: current_user
    })
    @my_posted_kata.save!

    redirect_to :action => :kata
  end


  def finish_kata
    @current_steps = 2
    @my_posted_kata = MyPostedKata.find params[:id]
    @my_posted_kata.update_attributes params[:my_posted_kata]

    set_current_step "homework", 3

    redirect_to :action => :homework
  end

  def homework
    @current_steps = 3
    @my_posted_homework = MyPostedHomework.find_by_user_id current_user.id
  end

  def finish_homework
    @current_steps = 3
    @my_posted_homework = MyPostedHomework.find_by_user_id current_user.id
    if !@my_posted_homework
      @my_posted_homework = MyPostedHomework.new params[:my_posted_homework]
      @my_posted_homework.user = current_user
      @my_posted_homework.save!
    end
    redirect_to :action => :homework
  end

  def wizard
    @current_steps = 1
  end

  private
    def set_current_step step, step_num
      @my_current_step_in_first_exam = MyCurrentStepInFirstExam.find_by_user_id current_user.id
      if(@my_current_step_in_first_exam.step_num < step_num)
        @my_current_step_in_first_exam.step = step
        @my_current_step_in_first_exam.step_num = step_num
        @my_current_step_in_first_exam.save!
      end

    end
end
