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


  devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => 'registrations'} 


  # devise_for :users,controllers: { confirmations: 'confirmations', registrations: 'registrations'} 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
