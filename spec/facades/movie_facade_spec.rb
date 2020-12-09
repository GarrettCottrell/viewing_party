require 'rails_helper'

describe 'Movie Facade' do
  it 'can search for an array of movie poros ' do
    movies = MovieFacade.search('Sunday')

    expect(movies).to be_an(Array)
    expect(movies.length).to eq(40)
    expect(movies.first.class).to eq(MoviePoro)
  end

  it 'can find the 40 top rated movies as movie poros' do
    movies = MovieFacade.top_40

    expect(movies).to be_an(Array)
    expect(movies.length).to eq(40)
    expect(movies.first).to be_a(MoviePoro)
    expect(movies.first.vote_average >= movies.second.vote_average).to eq(true)
  end

  it 'can get the details a movie with a movie id' do
    movie = MovieFacade.get_details(278)

    expect(movie).to be_a(MoviePoro)
    assert(movie.genres)
    assert(movie.reviews)
    assert(movie.cast)
  end
end
