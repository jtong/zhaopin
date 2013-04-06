class DevExamController < ApplicationController
  def kata
    @current_steps = 2
    @katas = Kata.all
    @my_posted_kata = MyPostedKata.find_by_user_id current_user.id
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

  def my_kata
    @current_steps = 2
    @kata = Kata.find params[:id]
    @my_posted_kata = MyPostedKata.find_by_user_id current_user.id
  end

  def finish_kata
    @current_steps = 2
    @my_posted_kata = MyPostedKata.find params[:id]
    @my_posted_kata.update_attributes params[:my_posted_kata]

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

end
