class ChuckService
  def self.conn
    Faraday.new('https://api.chucknorris.io')
  end

  def self.find_joke
    joke = conn.get('/jokes/random')

    JSON.parse(joke.body, symbolize_names: true)
  end
end
