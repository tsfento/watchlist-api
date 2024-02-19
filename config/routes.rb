Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # url.com/username
  get '/:username', to: 'users#show'

  # url.com/users
  post '/users', to: 'users#create'

  # url.com/username/edit
  put '/:username/edit', to: 'users#update'

  # url.com/:username
  delete '/:username', to: 'users#destroy'

  # url.com/:username/lists
  get '/:username/lists', to: 'users#lists_index'
  
  # url.com/username/lists/1
  get '/:username/lists/:id', to: 'users#list_show'

  # url.com/lists
  get '/lists', to: 'watch_lists#index'
end
