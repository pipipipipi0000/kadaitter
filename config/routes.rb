Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get 'home/index'

  get 'welcome', controller: 'home'

  resources :tweets, only: %i(create)
end
