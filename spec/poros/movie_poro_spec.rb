require 'rails_helper'

describe 'MoviePoro' do
  it 'Has readable attributes' do
    search_data = {
      :id=>9563,
      :title=>"Any Given Sunday",
      :vote_average=>6.8}
    details_data = {
      :genres=>[{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
      :id=>278,
      :original_title=>"The Shawshank Redemption",
      :overview=>
        "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      :runtime=>142,
      :vote_average=>8.7,}
    cast = [
      {:name=>"Tim Robbins",
       :character=>"Andy Dufresne"},
      {:name=>"Morgan Freeman",
       :character=>"Ellis Boyd \"Red\" Redding"}]
    reviews_data = {:id=>278,
       :page=>1,
       :results=>
        [{:author=>"elshaarawy"},
         {:author=>"John Chard"},
         {:author=>"tmdb73913433"},
         {:author=>"thommo_nz"},
         {:author=>"Andrew Gentry"},
         {:author=>"Matthew Dixon"}],
       :total_pages=>1,
       :total_results=>6}

    movie_poro = MoviePoro.new(search_data, details_data, cast, reviews_data)

    expected = [{:author=>"elshaarawy"},
     {:author=>"John Chard"},
     {:author=>"tmdb73913433"},
     {:author=>"thommo_nz"},
     {:author=>"Andrew Gentry"},
     {:author=>"Matthew Dixon"}]

    expect(movie_poro.title).to eq("Any Given Sunday")
    expect(movie_poro.id).to eq(9563)
    expect(movie_poro.vote_average).to eq(6.8)
    expect(movie_poro.genres).to eq("Drama, Crime")
    expect(movie_poro.runtime).to eq(142)
    expect(movie_poro.runtime_display).to eq("2 hr 22 min")
    expect(movie_poro.total_reviews).to eq(6)
    expect(movie_poro.reviews).to eq(expected)
    expect(movie_poro.api_id).to eq(278)
    expect(movie_poro.original_title).to eq("The Shawshank Redemption")
    expect(movie_poro.average_vote).to eq(8.7)
    expect(movie_poro.overview).to eq("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
  end
end
