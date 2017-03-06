Rails.application.routes.draw do

    root "posts#index"

    get "users/new" => "users#new", as: :new_user
    get "users/:id" => "users#show", as: :user
    post "users/" => "users#create"

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"


    get "users/:user_id/posts/" => "posts#index", as: :posts
    get "users/:user_id/posts/new" => "posts#new", as: :new_post
    post "users/:user_id/posts/" => "posts#create"
    get "users/:user_id/posts/:id/edit" => "posts#edit", as: :edit_post
    patch "users/:user_id/posts/:id" => "posts#update"
    get "users/:user_id/posts/:id" => "posts#show", as: :post
    delete "users/:user_id/posts/:id" => "posts#destroy"

end
