Rails.application.routes.draw do
  resources :average_ratings, only: [:index]
  resources :posts, :ratings, only: [:create]
end
