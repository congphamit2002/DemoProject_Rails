Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end