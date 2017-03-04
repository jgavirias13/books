Rails.application.routes.draw do
  devise_for :users
  root "libros#index"
  resources :libros
  post '/libros/find', to: "libros#find"
end
