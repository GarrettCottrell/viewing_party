require 'rails_helper'

describe 'movie service', :vcr do
  it 'find by title method', :vcr do
    response = MovieService.find_by_title('shawshank', 1)

    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Hash)

    expect(response[0]).to have_key(:title)
    expect(response[0][:title]).to be_a(String)

    expect(response[0]).to have_key(:vote_average)
    expect(response[0][:vote_average]).to be_an(Float)

    expect(response.length).to eq(2)
  end

  it 'top rated method', :vcr do
    response = MovieService.top_rated(1)

    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Hash)

    expect(response[0]).to have_key(:title)
    expect(response[0][:title]).to be_a(String)

    expect(response[0]).to have_key(:vote_average)
    expect(response[0][:vote_average]).to be_an(Float)

    expect(response.length).to eq(20)
  end

  it 'find details method', :vcr do
    response = MovieService.find_details(278)

    expect(response).to be_a(Hash)

    expect(response).to have_key(:title)
    expect(response[:title]).to be_a(String)

    expect(response).to have_key(:runtime)
    expect(response[:runtime]).to be_a(Integer)

    expect(response).to have_key(:genres)
    expect(response[:genres]).to be_an(Array)
    expect(response[:genres][0]).to be_a(Hash)
    expect(response[:genres][0][:name]).to be_a(String)
  end

  it 'find cast method', :vcr do
    response = MovieService.find_cast(278)

    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Hash)

    expect(response[0]).to have_key(:name)
    expect(response[0][:name]).to be_a(String)

    expect(response[0]).to have_key(:character)
    expect(response[0][:character]).to be_an(String)

    expect(response.length).to eq(10)
  end

  it 'find reviews method', :vcr do
    response = MovieService.find_reviews(278)

    expect(response).to be_a(Hash)
    expect(response[:results]).to be_an(Array)

    expect(response[:results][0]).to be_a(Hash)

    expect(response[:results][0]).to have_key(:author)
    expect(response[:results][0][:author]).to be_a(String)

    expect(response[:results][0]).to have_key(:content)
    expect(response[:results][0][:content]).to be_a(String)

    expect(response).to have_key(:total_results)
    expect(response[:total_results]).to be_an(Integer)
  end
end
