Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
  resources :explorers, only: [] do
    member do
      get :dashboard
    end
    collection do
      resources :playlists, only: [:show, :new, :create, :edit, :update, :destroy]
    end
  end

  resources :albums, only: [:show]

  resources :artists, only: [:show] do
    member do
      get :dashboard
    end
  end

end
