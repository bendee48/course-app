Rails.application.routes.draw do
  root 'static_pages#landing_page'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  devise_for :users
  resources :users, only: [:index]
  resources :courses
end
