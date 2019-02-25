Rails.application.routes.draw do
  root "billboards#index"

  get '/view_artists', to: 'artists#view_artists'
  get '/view_songs', to: 'songs#view_songs'

  devise_for :users

  resources :billboards do
  resources :artists
  end

  resources :artists do
    resources :songs
  end
  
end
