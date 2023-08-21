Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resources :categories
  end

  resources :categories

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
end