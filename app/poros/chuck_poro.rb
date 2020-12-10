class ChuckPoro
  attr_reader :joke

  def initialize(chuck_data)
    @joke = chuck_data[:value]
  end
end
