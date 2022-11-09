Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
  namespace :admin, defaults: { format: 'json' } do
    resources :frames, only: %i[index create update destroy]
    resources :lenses, only: %i[index create update destroy]

  end
  namespace :store, defaults: { format: 'json' } do
    resources :frames, only: %i[index  ]
    resources :lenses, only: %i[index  ]

    post '/shoplists/create_glasse', to: 'shoplists#create_glasse'
    get '/shoplists/show/:user_id', to: 'shoplists#show'
    resources :users , only: %i[index create]

  end
end
end
