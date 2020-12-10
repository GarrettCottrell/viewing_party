require 'rails_helper'

describe 'movie facade' do
  it 'search for poros', :vcr do
    movies = MovieFacade.search('Sunday')

    expect(movies).to be_an(Array)
    expect(movies.length).to eq(40)
    expect(movies.first.class).to eq(MoviePoro)
  end

  it 'find top rated poros', :vcr do
    movies = MovieFacade.top_forty

    expect(movies).to be_an(Array)
    expect(movies.length).to eq(40)
    expect(movies.first).to be_a(MoviePoro)
    expect(movies.first.vote_average >= movies.second.vote_average).to eq(true)
  end

  it 'movie details poro', :vcr do
    movie = MovieFacade.get_details(278)

    expect(movie).to be_a(MoviePoro)
    assert(movie.genres)
    assert(movie.reviews)
    assert(movie.cast)
  end
end
