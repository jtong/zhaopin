require_dependency "moode_user_plugin/application_controller"

module MoodeUserPlugin
  class RegisterController < ApplicationController
    include SessionsHelper
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(params[:user])
      @verify_code = VerifyCode.find_by_code(params[:verify_code])

      respond_to do |format|
        #if ( !MoodeUserPlugin.need_verify_code || valid_verify_code_for_user(@verify_code, @user) ) && @user.save
        if @user.save
          #VerifyCode.delete_codes_for_phone(@user.phone)
          sign_in @user
          format.html { redirect_to "/exam_choose/list_job_role", notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { redirect_to signin_path }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def valid_verify_code_for_user(verify_code, user)
      if verify_code.nil?
        user.errors.add(:verify_code, "not right")
        false
      elsif verify_code.bound_to_phone(user.phone)
        true                      
      else
        user.errors.add(:verify_code, "not right")
        false
      end
    end
  end
end
