Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'application#home'

  resources :races do
    resources :stats, only: [:show]
  end

  resources :locations
  resources :user_prs
  resources :stats, only: [:edit, :update]
end
