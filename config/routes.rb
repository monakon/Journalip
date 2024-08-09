Rails.application.routes.draw do

  root 'staticpages#top'

  resources :users, only: %i[new create destroy]
  resources :boards do
    collection do
      get 'mypage'
    end
  end
  resource :profiles

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'users/new'

  get 'pages/terms_of_use', to: 'pages#terms_of_use'
  get 'pages/privacy_policy', to: 'pages#privacy_policy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
