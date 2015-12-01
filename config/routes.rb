Rails.application.routes.draw do

  # Routes for groups (we want only to create new groups)
  resources :groups, only: [:create, :new]

  # Routes for visitors (we want all CRUD operations)
  resources :visitors

  # Routes for questions (we want CRUD)
  resources :questions

  # Routes for surveys (we want only to create new surveys)
  resources :surveys, only: [:create, :new]

  # Routes for administrators
  resources :admins, only: [:create, :edit, :update, :new]

  # Home page
  root 'groups#new'

  # Administrator section
  get 'admin' => 'visitors_statistics#show'
  get 'administrator' => 'visitors_statistics#show'

  # Visitor sing in page
  get 'signin' => 'groups#new', as: 'sign_in'

  # Visitors statistics page
  get 'visitors_statistics/show', as: 'visitors_statistics'

  # Visitors charts page
  get 'charts' => 'visitors_statistics#charts'

  # Visitors flot charts page
  get 'chartkick_charts' => 'visitors_statistics#chartkick_charts'

  # City autocomplete
  get 'zipcodes/city' => 'zipcodes#city'

  # Filtering area
  get 'filter_area'  => 'visitors#filter_area'

  # Routes for administrator login system
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # Routes for adding a new administrator
  get 'signup'  => 'admins#new'

  # Password reset
  resources :password_resets, only: [:create, :edit, :update]

  resource :visitors_statistics do
    post 'visitors_in_date'
  end
end
