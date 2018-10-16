Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/crete'
  get 'pages/edit'
  get 'pages/update'
  get 'pages/destroy'
  get 'pages/new'
  get  'pages/about'
   devise_for :users,controllers: { confirmations: 'confirmations' } 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
