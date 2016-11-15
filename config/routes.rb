Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :trainings
      post 'login' => 'sessions#create'
      delete 'logout' => 'sessions#destroy'
    end
  end


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'trainings/new'

  get 'users/new'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :trainings
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :training_divisions, only: [:index, :show]
end
