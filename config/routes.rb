Rails.application.routes.draw do
  get 'visitors_statistics/show'

  resources :admins
  resources :countries
  resources :zipcodes
  resources :surveys
  resources :questions
  resources :groups
  resources :visitors
  get 'homepage/index'

  root 'homepage#index'
end
