Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resources :categories
		resources :products
  end

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
end