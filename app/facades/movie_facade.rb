class MovieFacade
  def self.search(title)
    movies = []
    until movies.count >= 40
      movies_data = MovieService.search_by_title(title, page ||= 1)
      movies_data.each do |search_data|
        movies << MoviePoro.new(search_data)
      end
      # the magic number 20 is used here, because that is the default yield per page from this API
      break if movies_data.length < 20

      page += 1
    end
    movies.uniq
  end

  # change method name to top_movies(# of movies)
  def self.top_forty
    movies = []
    until movies.count >= 40
      movies_data = MovieService.top_rated(page ||= 1)
      movies_data.each do |search_data|
        movies << MoviePoro.new(search_data)
      end
      break if movies_data.length < 20

      page += 1
    end
    movies.uniq
  end

  def self.get_details(movie_id)
    details = MovieService.find_details(movie_id)
    cast = MovieService.find_cast(movie_id)
    reviews = MovieService.find_reviews(movie_id)

    MoviePoro.new(nil, details, cast, reviews)
  end
end
