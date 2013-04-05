class DevExamController < ApplicationController
  def kata
    @katas = Kata.all
    @my_posted_kata = MyPostedKata.find_by_user_id current_user.id
  end

  def choose_a_kata
    @kata = Kata.find params[:id]
    @my_posted_kata = MyPostedKata.new ({
      kata: @kata,
      user: current_user
    })
    @my_posted_kata.save!

    redirect_to :action => :kata
  end

  def homework

  end

end
