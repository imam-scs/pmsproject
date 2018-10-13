Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/crete'
  get 'pages/edit'
  get 'pages/update'
  get 'pages/destroy'
  get 'pages/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
