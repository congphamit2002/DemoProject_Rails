Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "home#index"
    devise_for :users, skip: [:omniauth_callbacks]
    namespace :admin do
      resources :categories
      resources :products
    end
  end
  devise_for :users, skip: [:session, :password, :registration], controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
end