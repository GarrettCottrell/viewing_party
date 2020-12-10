class ChuckFacade
  def self.find_joke
    joke = ChuckService.find_joke

    ChuckPoro.new(joke)
  end
end
