Rails.application.routes.draw do

# secret page (not in use)
  get "pages/secret"

# set root (Heroku needs it)
  root to: "users#show"

# posts
  get "users/:user_id/posts/" => "posts#index", as: :all_posts
  get "users/:user_id/posts/new" => "posts#new", as: :new_user_post
  get "users/:user_id/posts/:id" => "posts#show", as: :user_post
  post "users/:user_id/posts" => "posts#create", as: :user_posts
  get "users/:user_id/posts/:id/edit" => "posts#edit", as: :edit_user_post
  patch "users/:user_id/posts/:id" => "posts#update"
  delete "users/:user_id/posts/:id" => "posts#destroy"

# users
  get "users/" => "users#index", as: :users
  post "users/" => "users#create"
  get "users/new" => "users#new", as: :new_user
  get "users/:id" => "users#show", as: :user
  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

# login/logout
  get "/login" => "sessions#new"
  post "/login"    => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
