class MoviesController < ApplicationController
  def new
    @user = current_user
  end

  def index
    conn = Faraday.new(url:'https://api.themoviedb.org/3/movie?api_key=fffb60883e9ce66c7fd35f9e77ec9682')
    @movies = []
    page = 1

    if params[:Search_By_Movie_Title]
      until @movies.count >= 40
        response = conn.get("/3/search/movie?&query=#{params[:Search_By_Movie_Title]}")

        json = JSON.parse(response.body, symbolize_names: true)
        @movies << json[:results]
        @movies = @movies.flatten
        page += 1
      end

    else
      until @movies.count >= 40
        response = conn.get("/3/movie/top_rated?&page=#{page}")

        json = JSON.parse(response.body, symbolize_names: true)
        @movies << json[:results]
        @movies = @movies.flatten
        page += 1
      end
      @movies = @movies.first(40)
    end
  end

  def show
    conn = Faraday.new(url:'https://api.themoviedb.org/3/movie?api_key=fffb60883e9ce66c7fd35f9e77ec9682')

    response = conn.get("/3/movie/#{params[:id]}")
    @movie_details = JSON.parse(response.body, symbolize_names: true)

    @genres = @movie_details[:genres].map do |genre|
      genre[:name]
    end.join(', ')

    response = conn.get("/3/movie/#{params[:id]}/credits")
    json = JSON.parse(response.body, symbolize_names: true)
    @credits = json[:cast].first(10)

    response = conn.get("/3/movie/#{params[:id]}/reviews")
    @reviews = JSON.parse(response.body, symbolize_names:true)
    #can also make helper methods here for setting up api calls
      # Maybe? response = conn.get(cast_members)

  end
end
