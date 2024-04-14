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

  # get daily quote
  get '/quote', to: 'daily_quotes#get_quote'

  scope '/tmdb' do
    get '/now_playing_movies', to: 'tmdb#now_playing_movies'
    get '/popular_movies', to: 'tmdb#popular_movies'
    get '/trending_tv', to: 'tmdb#trending_tv'
    get '/this_week_tv', to: 'tmdb#this_week_tv'
    get '/movie/details/:id', to: 'tmdb#movie_details'
    get '/tv/details/:id', to: 'tmdb#tv_details'
    post '/search', to: 'tmdb#search_tmdb'
    get '/movie/:id/recommendations', to: 'tmdb#movie_recommendations'
    get '/tv/:id/recommendations', to: 'tmdb#tv_recommendations'
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
    delete '/:username/lists/:id', to: 'users#delete_list'
    # get a specific user's followed lists
    get '/:username/followed_lists', to: 'users#followed_lists_index'
    # follow a user's list
    get '/follow_list/:id', to: 'watch_lists#follow_list'
    # unfollow a user's list
    get '/unfollow_list/:id', to: 'watch_lists#unfollow_list'
    # add a title to a specific list for a specific user
    post '/:username/lists/:id', to: 'watch_titles#add_title_to_list'
    # delete a title from a list
    delete '/:username/lists/:id/:tmdb_id', to: 'watch_titles#delete_title'
    # get user_watch_titles for a specific user
    # refactored to send with user bootstrap
    # get '/:username/user_watch_titles', to: 'user_watch_titles#get_user_watch_titles'
    # add watch date to title for specific user
    post '/:username/add_watch_date', to: 'watch_dates#add_watch_date'
    # get watch dates for user
    get '/:username/watch_dates', to: 'watch_dates#get_watch_dates'
    # get specific watch date for user
    post '/:username/watch_date', to: 'watch_dates#search_watch_date'
    # get watch dates for specific title
    post '/:username/watch_dates', to: 'watch_dates#search_title_dates'
    # delete a watch date for user
    delete '/:username/watch_date/:tmdb_id/:date', to: 'watch_dates#delete_watch_date'
    # set title watched for user
    post '/:username/set_watched', to: 'user_watch_titles#set_watched'
    # set rating for title
    post '/:username/set_rating', to: 'user_watch_titles#set_rating'
    # set privacy for a list
    get '/:username/:id/set_privacy', to: 'watch_lists#set_privacy'
  end
  

  # url.com/lists
  get '/lists', to: 'watch_lists#index'
  # search lists
  post '/lists/:id/search', to: 'watch_lists#search_list'
  # get random title from list
  get '/lists/:id/random', to: 'watch_lists#random_title'

  # url.com/addtitle
  # post '/add_title', to: 'watch_titles#create'
end
