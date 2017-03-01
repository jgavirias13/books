Rails.application.routes.draw do
  devise_for :users
  root "libros#index"
  resources :libros
end
