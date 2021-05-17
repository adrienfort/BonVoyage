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

  get 'components', to: 'pages#components'

  root to: 'pages#home'
  resources :explorers, only: [] do
    resources :artists, only: [:show] do
      resources :fan_artists, only: [:create, :destroy]
      resources :albums, only: [] do
        member do
          get :show_explorer
        end
        resources :fan_albums, only: [:create, :destroy]
        resources :musics, only: [] do
          resources :fan_musics, only: [:create, :destroy]
        end
      end
    end
    resources :musics, only: [] do
      resources :playlist_musics, only: [:new, :create]
      resources :plays, only: [:create]
    end
    resources :playlists, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :playlist_musics, only: [:destroy]
    end
    member do
      get :dashboard
      get :research
      get :rakings
    end
  end

  resources :musics, only: [] do
    resources :plays, only: [:create]
  end

  resources :artists, only: [] do
    resources :albums, only: [:new, :create, :edit, :update, :destroy] do
      member do
        get :show_artist
      end
    end
    member do
      get :dashboard
    end
  end

end
