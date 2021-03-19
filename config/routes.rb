Rails.application.routes.draw do

  resources :departments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
  #   get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  # end
  
  # devise_for :users, path: "auth", :controllers => {sessions: 'sessions', registrations: 'registrations', confirmations: 'confirmations', passwords: 'passwords', omniauth_callbacks: 'omniauth_callbacks'} 

  root "employees#index"
   
  resources :employees
  resources :products 

  resources :employees do
    collection do
      get :autocomplete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
