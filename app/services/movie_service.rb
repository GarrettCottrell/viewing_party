class MovieService
  def self.search_by_title(title, page)
    response = conn.get('/3/search/movie') do |req|
      req.params[:query] = title
      req.params[:page] = page
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.top_rated(page)
    response = conn.get('/3/movie/top_rated') do |req|
      req.params[:page] = page
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.find_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:cast].first(10)
  end

  def self.find_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.themoviedb.org/3/movie',
      params: { api_key: ENV['viewing_party_key'] }
    )
  end
end
