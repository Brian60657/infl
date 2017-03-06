Rails.application.routes.draw do

  # page not in use yet
    #get 'pages/secret'

  # set root (Heroku needs it)
    root "posts#index"

    # get "users/" => "users#index"
    get "users/new" => "users#new", as: :new_user
    post "users/" => "users#create"
    # get "users/:id/edit" => "users#edit", as: :edit_user
    # patch "users/:id" => "users#update"
    # get "users/:id" => "users#show", as: :user
    # delete "users/:id" => "users#destroy"

    # from Ira
    #   get "users/new" => "users#new", as: :new_user (MOVED TO TOP)
    #   post "users/" => "users#create"               (MOVED TO TOP)
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"


    get "posts/" => "posts#index"
    get "posts/new" => "posts#new", as: :new_post
    post "posts/" => "posts#create"
    get "posts/:id/edit" => "posts#edit", as: :edit_post
    patch "posts/:id" => "posts#update"
    get "posts/:id" => "posts#show", as: :post
    delete "posts/:id" => "posts#destroy"


end
