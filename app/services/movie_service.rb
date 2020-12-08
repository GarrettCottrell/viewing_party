class MovieService
  def self.find_by_title(title)
    response = conn.get("/3/search/movie?&query=#{title}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.find_runtime(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:runtime]
  end

  private
    def self.conn
      Faraday.new(
        url: 'https://api.themoviedb.org/3/movie',
        params: { api_key: ENV['viewing_party_key'] })
    end
end
