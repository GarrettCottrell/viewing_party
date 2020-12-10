class MoviesController < ApplicationController
  def index
    if params[:Search_By_Movie_Title]
      title = params[:Search_By_Movie_Title]
      @movies = MovieFacade.search(title)
    else
      @movies = MovieFacade.top_forty
    end
  end

  def show
    @movie = MovieFacade.get_details(params[:id])
  end
end
