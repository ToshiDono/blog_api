Rails.application.routes.draw do
  resources :posts, :ratings, only: [:create]
end
