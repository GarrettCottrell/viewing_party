class ChuckFacade

  def self.get_joke
    joke = ChuckService.get_joke

    ChuckPoro.new(joke)
  end
end
