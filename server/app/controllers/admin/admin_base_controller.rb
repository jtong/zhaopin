module Admin
  class AdminBaseController < ApplicationController
    before_filter :authorize_is_admin, :except => :login
    protected
      def authorize_is_admin
        user = User.find_by_id session[:user_id]
        if !user.is_admin
          redirect_to controller: "/users", action: :show
        end
      end
  end
end