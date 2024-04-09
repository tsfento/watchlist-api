require 'rest-client'

class TmdbController < ApplicationController
    def initialize
        @token = Rails.application.credentials.tmdb_token

        @base_url = 'https://api.themoviedb.org/3'
    end

    def now_playing_movies
        # https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc

        response = RestClient.get("#{@base_url}/movie/now_playing?language=en-US&page=1", {
            Authorization: "Bearer #{@token}"
        })

        # json_response = JSON.parse(response, symbolize_names: true)
        # json_response[:results].map! { |t| movie_details(t[:id]) }

        # puts json_response

        # render json: json_response, status: :ok
        render json: response, status: :ok
    end

    def popular_movies
        # https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc

        response = RestClient.get("#{@base_url}/movie/popular?language=en-US&page=1", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def trending_tv
        # https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc

        # response = RestClient.get("#{@base_url}/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_origin_country=US&with_original_language=en&without_genres=10763%2C%2010767", {
        #     Authorization: "Bearer #{@token}"
        # })

        'https://api.themoviedb.org/3/trending/tv/week?language=en-US'
        response = RestClient.get("#{@base_url}/trending/tv/week?language=en-US", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def this_week_tv
        # https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc

        # response = RestClient.get("#{@base_url}/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=vote_count.desc&with_origin_country=US&with_original_language=en", {
        #     Authorization: "Bearer #{@token}"
        # })

        current_week = Date.today.cweek
        current_year = Date.today.cwyear
        week_start = Date.commercial(current_year, current_week, 1).strftime()
        week_end = Date.commercial(current_year, current_week, 7).strftime()

        # 'https://api.themoviedb.org/3/discover/tv?air_date.gte=2024-04-08&air_date.lte=2024-04-14&include_adult=false&include_null_first_air_dates=false&language=en&page=1&sort_by=popularity.desc&with_genres=10759%20%7C%2016%20%7C%2035%20%7C%2080%20%7C%2099%20%7C%2018%20%7C%2010751%20%7C%209648%20%7C%2010765%20%7C%2037&with_origin_country=US&without_genres=10767%20%7C%2010762%20%7C%2010763%20%7C%2010764%20%7C%2010766'

        response = RestClient.get("#{@base_url}/discover/tv?air_date.gte=#{week_start}&air_date.lte=#{week_end}&include_adult=false&include_null_first_air_dates=false&language=en&page=1&sort_by=popularity.desc&with_genres=10759%20%7C%2016%20%7C%2035%20%7C%2080%20%7C%2099%20%7C%2018%20%7C%2010751%20%7C%209648%20%7C%2010765%20%7C%2037&with_origin_country=US&without_genres=10767%20%7C%2010762%20%7C%2010763%20%7C%2010764%20%7C%2010766", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def movie_details

        response = RestClient.get("#{@base_url}/movie/#{params[:id]}?language=en-US", {
            Authorization: "Bearer #{@token}"
        })
        # response = RestClient.get("#{@base_url}/movie/#{id}?language=en-US", {
        #     Authorization: "Bearer #{@token}"
        # })

        # JSON.parse(response)

        render json: response, status: :ok
    end

    def tv_details
        response = RestClient.get("#{@base_url}/tv/#{params[:id]}?language=en-US", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def search_tmdb
        response = RestClient.get("#{@base_url}/search/#{params[:type]}?query=#{params[:query]}&include_adult=false&language=#{params[:lang]}&page=#{params[:page]}", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def movie_recommendations
        # https://api.themoviedb.org/3/movie/{movie_id}/recommendations
        response = RestClient.get("#{@base_url}/movie/#{params[:id]}/recommendations", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def tv_recommendations
        # https://api.themoviedb.org/3/movie/{movie_id}/recommendations
        response = RestClient.get("#{@base_url}/tv/#{params[:id]}/recommendations", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end
end
