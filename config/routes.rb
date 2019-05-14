Rails.application.routes.draw do
  resources :races
  resources :locations
  resources :stats
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
end
