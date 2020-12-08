class MoviePoro
  def initialize(search_data, runtime)
    @title = search_data[:title]
    @id = search_data[:id]
    @vote_average = search_data[:vote_average]
    @runtime = runtime
  end
end
