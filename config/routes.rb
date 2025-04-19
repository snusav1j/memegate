Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }
  devise_scope :user do
    get    'signup',  to: 'devise/registrations#new', as: :signup
    get    'login',   to: 'devise/sessions#new',       as: :login
    delete 'logout',  to: 'devise/sessions#destroy',   as: :logout
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root "home#index"
  # get "/signup", to: "users#new"
  # get "/login", to: "sessions#new"
  # get "/user_profiles/", to: "user_profiles#index"
  # get "/logout", to: "sessions#logout"

  resources :home do
    collection do

    end
  end

  resources :users do
    collection do

    end
  end


end
