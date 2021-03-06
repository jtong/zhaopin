Server::Application.routes.draw do
  resources :my_job_roles


  resources :my_posted_homeworks


  resources :homeworks


  resources :my_posted_katas


  resources :katas


  resources :my_questions


  resources :my_exams


  resources :exam_papers

  namespace :admin do
    resources :question_templates
  end

  match "/logic_exam/" => "logic_exam#index", as: "logic_exam"
  match "/logic_exam/:exam_id/:question_id/answer" => "logic_exam#answer", :via => :post

  match "/admin/logic_exam/result", :to => "admin/logic_exam#result", :module => "admin"

  match "/admin/" => "admin/home#index", as: "admin_home", module: "admin"


  match "admin/:controller/:action"
  match "admin/:controller/:action/:id"
  match ":controller/:action"
  match ":controller/:action/:id"

  mount MoodeUserPlugin::Engine, :at => '/'

  root :to => redirect('/exam_choose/list_job_role')

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
