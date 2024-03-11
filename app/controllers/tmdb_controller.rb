require 'rest-client'

class TmdbController < ApplicationController
    def initialize
        @token = Rails.application.credentials.tmdb_token

        @base_url = 'https://api.themoviedb.org/3'
    end

    def now_playing_movies
        response = RestClient.get("#{@base_url}/movie/now_playing?language=en-US&page=1", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def popular_movies
        response = RestClient.get("#{@base_url}/movie/popular?language=en-US&page=1", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def popular_tv
        response = RestClient.get("#{@base_url}/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_origin_country=US&with_original_language=en&without_genres=10763%2C%2010767", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def top_rated_tv
        response = RestClient.get("#{@base_url}/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=vote_count.desc&with_origin_country=US&with_original_language=en", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def movie_details
        response = RestClient.get("#{@base_url}/movie/#{params[:id]}?language=en-US", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def tv_details
        response = RestClient.get("#{@base_url}/tv/#{params[:id]}?language=en-US", {
            Authorization: "Bearer #{@token}"
        })

        render json: response, status: :ok
    end

    def search_tmdb
        # response = RestClient.get("#{base_url}")
    end
end
