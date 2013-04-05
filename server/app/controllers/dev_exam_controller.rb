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

  def homework
    @current_steps = 3
  end

  def wizard
    @current_steps = 1
  end

end
