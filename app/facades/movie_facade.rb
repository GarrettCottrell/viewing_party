class MovieFacade
  def self.search(title)
    movies = []
    page = 1
    until movies.count >= 40
      movies_data = MovieService.find_by_title(title, page)
      movies_data.each do |search_data|
        movies << MoviePoro.new(search_data)
      end
      # leave comment here explaining the usage of the number 20
      break if movies_data.length < 20
      page += 1
    end
    movies.uniq
  end

  # change method name to top_movies(# of movies)
  def self.top_40
    movies = []
    page = 1
    until movies.count >= 40
      movies_data = MovieService.top_rated(page)
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
