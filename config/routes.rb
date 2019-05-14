Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'application#home'

  resources :races do
    resources :stats
  end

  resources :stats
  resources :locations
  resources :user_prs
end
