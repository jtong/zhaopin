module Admin
  class AdminController <  ApplicationController
    before_filter :admin_authenticate
    layout "admin"

  end
end