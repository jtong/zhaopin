class ExamChooseController < ApplicationController
  layout "capability"

  def list_job_role
    @my_job_role = MyJobRole.find_by_user_id current_user.id
    if(@my_job_role)
      redirect_to :controller => "#{@my_job_role.name}_exam", :action => :current_step
    end
  end

  def choose_job_role
    @my_job_role = MyJobRole.find_by_user_id current_user.id
    if(!@my_job_role)
      @my_job_role = MyJobRole.new
      @my_job_role.user = current_user
      @my_job_role.is_current = true
      @my_job_role.name = params[:my_job_role]
      @my_job_role.save!
    end
    redirect_to :controller => "#{@my_job_role.name}_exam", :action => :current_step
  end
end
