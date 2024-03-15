Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'web/bootstrap'

  # url.com/login
  post '/login', to: 'sessions#create'

  scope '/tmdb' do
    get '/now_playing_movies', to: 'tmdb#now_playing_movies'
    get '/popular_movies', to: 'tmdb#popular_movies'
    get '/popular_tv', to: 'tmdb#popular_tv'
    get '/top_rated_tv', to: 'tmdb#top_rated_tv'
    get '/movie/details/:id', to: 'tmdb#movie_details'
    get '/tv/details/:id', to: 'tmdb#tv_details'
    post '/search', to: 'tmdb#search_tmdb'
  end

  scope '/users' do
    # show specific user
    get '/:username', to: 'users#show'
    # create a new user
    post '/sign_up', to: 'users#create'
    # update a specific user
    put '/:username/edit', to: 'users#update'
    # delete a specific user
    delete '/:username', to: 'users#destroy'
    # get all lists of a specific user
    get '/:username/lists', to: 'users#lists_index'
    # create a new list for a specific user
    post '/:username/lists', to: 'watch_lists#create'
    # get specific list from specific user
    get '/:username/lists/:id', to: 'users#titles_show'
    # delete list
    delete '/:username/lists/:id', to: 'users'
    # get a specific user's followed lists
    get '/:username/followed_lists', to: 'users#followed_lists_index'
    # add a title to a specific list for a specific user
    post '/:username/lists/:id', to: 'watch_titles#add_title_to_list'
    # get user_watch_titles for a specific user
    # get '/:username/user_watch_titles', to: 'user_watch_titles#get_user_watch_titles'
  end
  

  # url.com/lists
  get '/lists', to: 'watch_lists#index'

  # url.com/addtitle
  post '/add_title', to: 'watch_titles#create'
end
