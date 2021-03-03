Rails.application.routes.draw do
  devise_for :artists, controllers: {
    confirmations: 'artists/confirmations',
    passwords: 'artists/passwords',
    registrations: 'artists/registrations',
    sessions: 'artists/sessions',
    unlocks: 'artists/unlocks'
  }
  devise_for :explorers, controllers: {
    confirmations: 'explorers/confirmations',
    passwords: 'explorers/passwords',
    registrations: 'explorers/registrations',
    sessions: 'explorers/sessions',
    unlocks: 'explorers/unlocks'
  }

  root to: 'pages#home'
  resources :explorers, only: [:show]
  resources :artists, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
