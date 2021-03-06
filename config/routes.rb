BatchManagementSystem::Application.routes.draw do

devise_for :users, :path_names => {:sign_in => 'login', 
              :sign_out => 'logout',    
	      :password => 'secret',    
	      :confirmation => 'verification', 
	      :root_path => 'home#index'  
	      } 

  resources :trainers do
    collection do
      delete 'destroy_multiple'
    end
  end
match '/studentinfo' => 'enquiries#studentinfo', via: :get
resources :enquiries do
    collection do
      delete 'destroy_multiple'
    end
  end

    match'/grades/:grade_id/fees' => 'grades#fees', via: :get, as: :fees
    resources :sponsors do
    collection do
      delete 'destroy_multiple'
    end
  end

   #resources :grades do
    #collection do
      #delete 'multipledelete'
      match'/:grade_id/subjects/update_multiple' => 'grades#update_multiple', :via =>[:get, :put ], as: :update_multiple
    #end
   #resources :batches do
    #collection do
     #delete 'multipledelete'
    #end
  #end
#end
#map.resources :grades, :shallow => true do |grade|
#delete 'multipledelete'
  #grade.resources :batches do |batch|
  #delete 'multipledelete'
    #batch.resources :reports
  #end
#end 
  resources :grades, :shallow => true do
collection do
     delete 'multipledelete'
end
    resources :batches do
collection do
     delete 'multipledelete'
end
      resources :lectures
      resources :exams
    end
  end
    #resources :batches do
        #resources :reports
  #end
 resources :subjects do
   collection do
     delete 'destroy_multiple'
   end
 end

  resources :states do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :cities do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :students do
    collection do
      delete 'destroy_multiple'
#      put 'ban_multiple'
       post 'assign_batch_multiple'
    end
  end

  match'/students/:student_id/banmultiple' => 'students#banmultiple', :via => [:get, :put], as: :banmultiple
  match '/index_action' => 'students#index_action', :via => :get
  match '/grades/:grade_id/batches' => 'batches#index' 
  match'/students/:student_id/addmition' => 'students#addmition', :via => [:get, :post], as: :addmition

  match '/assign_batch' => 'students#assign_batch', :via => [:get, :post]
  match '/addgrade' => 'students#addgrade', :via => [:get, :post], as: :addgrade
  match '/student/:state_id/city' => 'students#city', :via => :get, as: :city
  match '/students/:grade_id/assign_batch_multiple' => 'students#assign_batch_multiple', :via => [:get, :post], as: :assign_batch_multiple
  match '/grade/:grade_id/subjects' => 'grades#subjects_list', :via => [:get, :post], as: :subjects_list
  match '/grade/:grade_id/batch/:batch_id/students' => 'batches#assignbatch', :via => [:get, :post], as: :assignbatch
    match '/students/:student_id/document' => 'students#document', via: :get
  match '/grades/batch/:batch_id/attendents' => 'batches#attendents', :via => [:get, :post], as: :attendents

  match'/marking_pattens/:marking_patten_id' => 'grades#destroy_marking_patten', :via => :delete, as: :destroy_marking_patten
  match '/studentinfo' => 'enquiries#studentinfo', via: :get
  match'/grade/:grade_id/subjects/update_multiple' => 'grades#update_multiple', :via =>[:get, :put ], as: :update_multiple
  match'/enquiry/:enquiry_id/students/new' => 'students#enrollement', :via => :get, as: :enrollement

# match '/trainer/ability' => 'trainers#ability', :via => :post, as: :ability

match '/trainers/:trainer_id/ability' => 'trainers#ability', :via => [:get, :post], as: :ability
match 'trainers/:trainer_id/display' => 'trainers#display', :via =>  :get, as: :display
  # The priority is based upon order of creation:
  # first created -> highest priority.
root :to => 'home#index'
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

