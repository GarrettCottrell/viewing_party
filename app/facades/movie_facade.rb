class MovieFacade
  def self.search(title)
    movies_data = MovieService.find_by_title(title)
    movies_data.map do |search_data|
      runtime = MovieService.find_runtime(search_data[:id])
      MoviePoro.new(search_data, runtime)
    end
  end

  def self.top_40

  end
end
