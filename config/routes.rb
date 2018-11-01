Rails.application.routes.draw do
  
  
  get 'two_factor/index'
  get 'two_factor/new'
  get 'two_factor/create'
  get 'two_factor/show'
  get 'uploadfile/index'
  get 'uploadfile/new'
  get 'uploadfile/create'
  get 'uploadfile/destroy'
  resources :taskdetails
  resources :projects
  resources :organizations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'pages/crete'
  get 'pages/edit'
  get 'pages/update'
  get 'pages/destroy'
  get 'pages/new'
  get  'pages/about'


  devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => 'registrations', :sessions => 'sessions' } 



devise_scope :user do
    post "/sessions/verify_otp" => "sessions#verify_otp"

    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :two_factor do
    collection do
      post :activate
      post :deactivate
    end
  end


root 'pages#home'
  # devise_for :users,controllers: { confirmations: 'confirmations', registrations: 'registrations'} 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
