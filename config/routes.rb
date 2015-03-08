Rails.application.routes.draw do
  resources :rooms

  resources :schedulings

  root 'welcome#index'

  resources :users

  get  "users/index"
  get  "/login"           => "users#login"
  post "/signin"          => "users#authenticate"
  get  "/signup"          => "users#new"
  get  "/logout"          => "users#logout"
  get  "/password"        => "users#password"
  post "/password_update" => "users#password_update"
end
