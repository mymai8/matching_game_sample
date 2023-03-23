Rails.application.routes.draw do
  devise_for :users
  root to: 'coaches#index'
  resources :users
  resources :coaches
end
