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
    resources :artists, only: [:show] do
      resources :fan_artists, only: [:create, :destroy]
      resources :albums, only: [:show] do
        resources :fan_albums, only: [:create, :destroy]
        resources :musics, only: [] do
          resources :fan_musics, only: [:create, :destroy]
        end
      end
    end
    resources :musics, only: [] do
      resources :playlist_musics, only: [:new, :create, :delete]
    end
    resources :playlists, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :dashboard
    end
  end

  resources :artists, only: [] do
    resources :albums, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :dashboard
    end
  end

end
