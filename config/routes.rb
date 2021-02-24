Rails.application.routes.draw do
  devise_for :artists
  devise_for :explorers

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
