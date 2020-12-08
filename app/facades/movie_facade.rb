class MovieFacade
  def self.search(title)
    movies = []
    page = 1
    until movies.count >= 40 || page == 3
      movies_data = MovieService.find_by_title(title, page)
      movies_data.each do |search_data|
        runtime = MovieService.find_runtime(search_data[:id])
        movies << MoviePoro.new(search_data, runtime)
      end
      page += 1
    end
    movies.uniq
  end

  def self.top_40
    movies = []
    page = 1
    until movies.count >= 40 || page == 3
      movies_data = MovieService.top_rated(page)
      movies_data.each do |search_data|
        runtime = MovieService.find_runtime(search_data[:id])
        movies << MoviePoro.new(search_data, runtime)
      end
      page += 1
    end
    movies.uniq
  end
end
