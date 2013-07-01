module Admin
  class LogicExamController <  ApplicationController
    before_filter :admin_authenticate

    def result
      @my_exams = MyExam.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @my_exams }
      end
    end
  end
end