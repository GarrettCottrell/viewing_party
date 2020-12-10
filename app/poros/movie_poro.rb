class MoviePoro
  attr_reader :search_data,
              :details_data,
              :cast,
              :reviews_data

  def initialize(search_data = nil, details_data = nil, cast = nil, reviews_data = nil)
    @search_data = search_data
    @details_data = details_data
    @cast = cast
    @reviews_data = reviews_data
  end

  def title
    @search_data[:title]
  end

  def id
    @search_data[:id]
  end

  def vote_average
    @search_data[:vote_average]
  end

  def genres
    if @details_data[:genres].empty?
      'No genres found.'
    else
      @details_data[:genres].map do |genre|
        genre[:name]
      end.join(', ')
    end
  end

  def runtime
    @details_data[:runtime]
  end

  def runtime_display
    if (@details_data[:runtime]).zero?
      'Runtime information unavailable.'
    else
      "#{@details_data[:runtime] / 60} hr #{@details_data[:runtime] % 60} min"
    end
  end

  def total_reviews
    @reviews_data[:total_results]
  end

  def reviews
    @reviews_data[:results]
  end

  def api_id
    @details_data[:id]
  end

  def original_title
    @details_data[:original_title]
  end

  def average_vote
    @details_data[:vote_average]
  end

  def overview
    @details_data[:overview]
  end
end
