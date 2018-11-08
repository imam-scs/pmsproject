Rails.application.routes.draw do
  
  
  get 'uploadfile/index'
  get 'uploadfile/new'
  get 'uploadfile/create'
  get 'uploadfile/destroy'
  resources :taskdetails
  resources :projects
  resources :organizations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'
  get 'pages/crete'
  get 'pages/edit'
  get 'pages/update'
  get 'pages/destroy'
  get 'pages/new'
  get  'pages/about'


  # get 'displayqr/show'
  # get  'diplayqr/update'
  # get 'diplayqr/refresh'

  # get 'checkga/show'

  # get 'checkga/update'

  devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => 'registrations'} 

   def devise_displayqr(mapping, controllers)
      resource :displayqr, :only => [:show, :update], :path => mapping.path_names[:displayqr], :controller => controllers[:displayqr] do
        post :refresh, :path => mapping.path_names[:refresh], :as => :refresh
      end
      resource :checkga, :only => [:show, :update], :path => mapping.path_names[:checkga], :controller => controllers[:checkga]
    end

   
resources :checkga do
    collection do
      put :show
     end
  end

  resources :displayqr do
    collection do
      post :show
     end
  end

# resources :users do
#     member do
#       get :displayqr_update, to: 'users/displayqr#update'
#       post :devisepq_show, to: 'users/displayqr#show'
#     end
#   end
  # devise_for :users,controllers: { confirmations: 'confirmations', registrations: 'registrations'} 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
