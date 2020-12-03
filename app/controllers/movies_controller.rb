class MoviesController < ApplicationController
  def new
    @user = current_user
  end

  def index
    conn = Faraday.new(url:'https://api.themoviedb.org/3/movie?api_key=fffb60883e9ce66c7fd35f9e77ec9682' )
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

  def show; end
end
