Rails.application.routes.draw do
  get 'session/new'

  resources :admins
  resources :countries
  resources :zipcodes
  resources :surveys
  resources :questions
  resources :groups
  resources :visitors
  get 'homepage/index'

  root 'homepage#index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup'  => 'admins#new'
end
