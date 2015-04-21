Rails.application.routes.draw do



  resources :directors
  resources :orders do 
    collection do 
      get :express
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  devise_for :users, :controllers => {:registrations => "registrations",:invitations => 'users/invitations' }

  root 'home#index'
  get "users/express"

  put   'productions/:production_id/update_director'   =>  'productions#update_director',    as: :update_production_director
  #get 'auth/:provider/callback', to: 'users#oauth_login'
  get '/auth/:provider/callback' => 'users#oauth_login'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #resources :invitations,path: "invites",only: [:new,:create,:index,:destroy,:edit]
  #resources :invitations
  get 'invitations/new', to: 'invitations#new'
  post 'invitations', to: 'invitations#create', as: 'invitations'
  get '/invitations', to: 'invitations#index'
  # get '/invitations/:id', to: 'invitations#show'
  resources :resumes do
    collection do
      get :email_resume
      get :download_pdf
      get :find_user_role
      get :account_tier
      get :new_theatre
      post :new_theatre
      get :page_view
    end
    resources :roles

  end
  post   '/sort_sections'      => 'resumes#sort_sections',      :as => 'sort_sections'

  get    '/resumes/view_resume_pdf/:id'  => 'resumes#view_resume_pdf', :as => 'view_resume_pdf'
  get    '/resumes/:id/edit/:role_id'  => 'resumes#edit_with_role', :as => 'edit_resume_with_role'
  post   '/resumes/:id/add_table'      => 'resumes#add_table',      :as => 'add_resume_table'
  delete '/resumes/:id/destroy_table/:table_id'  => 'resumes#destroy_table',  :as => 'destroy_resume_table'
  post   '/upload'=> 'resumes#upload', :as => 'upload'
  post   '/autosuggest'=> 'resumes#autosuggest', :as => 'autosuggest'


  
  get 'users' => 'users#index', :as => 'users'
  get 'users/:id' => 'users#show', :as => 'profile'
  get  '/add_frineds'  => 'users#add_frineds', :as => 'add_frineds'

  resources :shows

  resources :productions do
    resources :shows
    resources :roles
    resources :director_invitations
    resources :artist_invitations
    collection do
      get :find_company
    end
  end

  resources :rtables do
    resources :rtable_items
  end

  resources :education_tables do
    resources :rtable_items
  end

  resources :companies do
    resources :artist_invitations
  end

  resources :venues do
    resources :artist_invitations
  end
  get  '/venues/:name'  => 'venues#show', :as => 'venue_show'

  post 'section_slots' => 'section_slots#sort', :as => 'sort_section_slots'
  get  '/paypal_url'  => 'home#paypal_url', :as => 'paypal_url'
  get  '/about'  => 'home#about', :as => 'about'
  get  '/faq'  => 'home#faq', :as => 'faq'
  get  '/terms_and_conditions'  => 'home#terms_and_conditions', :as => 'terms_and_conditions'
  get  '/contact'  => 'home#contact', :as => 'contact'
  get  '/privacy'  => 'home#privacy', :as => 'privacy'
  get  '/copyright'  => 'home#copyright', :as => 'copyright'

  match "/404", :to => "errors#file_not_found", via: 'get'
  # match "/422", :to => "errors#unprocessable", via: 'get'
  # match "/500", :to => "errors#internal_server_error", via: 'get'
  delete '/resumes/:id/remove_video/:video_id'  => 'resumes#remove_video',:as => 'destroy_resume_video'
  post 'add_videos' => 'resumes#add_videos',:as=>'add_videos'

end
