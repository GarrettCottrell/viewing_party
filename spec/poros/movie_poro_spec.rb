require 'rails_helper'

describe 'MoviePoro' do
  it 'Has readable attributes' do
    search_data = {
      :adult=>false,
      :backdrop_path=>"/lqASDYSyYMgC1gYY7VHqK9Tnv0I.jpg",
      :genre_ids=>[18],
      :id=>9563,
      :original_language=>"en",
      :original_title=>"Any Given Sunday",
      :overview=>
       "A star quarterback gets knocked out of the game and an unknown third stringer is called in to replace him. The unknown gives a stunning performance and forces the ageing coach to reevaluate his game plans and life. A new co-owner/president adds to the pressure of winning. The new owner must prove herself in a male dominated world.",
      :popularity=>15.969,
      :poster_path=>"/eiWm5abcED5wKPV5LoXgfFoMpLK.jpg",
      :release_date=>"1999-12-16",
      :title=>"Any Given Sunday",
      :video=>false,
      :vote_average=>6.8,
      :vote_count=>1096}
    details_data = {
      :adult=>false,
      :backdrop_path=>"/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg",
      :belongs_to_collection=>nil,
      :budget=>25000000,
      :genres=>[{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
      :homepage=>"",
      :id=>278,
      :imdb_id=>"tt0111161",
      :original_language=>"en",
      :original_title=>"The Shawshank Redemption",
      :overview=>
        "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      :popularity=>37.602,
      :poster_path=>"/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      :production_companies=>
        [{:id=>97,
          :logo_path=>"/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
          :name=>"Castle Rock Entertainment",
          :origin_country=>"US"}],
      :production_countries=>[{:iso_3166_1=>"US", :name=>"United States of America"}],
      :release_date=>"1994-09-23",
      :revenue=>28341469,
      :runtime=>142,
      :spoken_languages=>[{:english_name=>"English", :iso_639_1=>"en", :name=>"English"}],
      :status=>"Released",
      :tagline=>"Fear can hold you prisoner. Hope can set you free.",
      :title=>"The Shawshank Redemption",
      :video=>false,
      :vote_average=>8.7,
      :vote_count=>17683}
    cast = [
      {:adult=>false,
       :gender=>2,
       :id=>504,
       :known_for_department=>"Acting",
       :name=>"Tim Robbins",         :original_name=>"Tim Robbins",
       :popularity=>2.82,
       :profile_path=>"/9DujxnBMVkizaeIyM0eXPMfXxR.jpg",
       :cast_id=>3,
       :character=>"Andy Dufresne",
       :credit_id=>"52fe4231c3a36847f800b131",
       :order=>0},
      {:adult=>false,
       :gender=>2,
       :id=>192,
       :known_for_department=>"Acting",
       :name=>"Morgan Freeman",
       :original_name=>"Morgan Freeman",
       :popularity=>16.656,
       :profile_path=>"/oIciQWr8VwKoR8TmAw1owaiZFyb.jpg",
       :cast_id=>4,
       :character=>"Ellis Boyd \"Red\" Redding",
       :credit_id=>"52fe4231c3a36847f800b135",
       :order=>1}]
    reviews_data = {:id=>278,
       :page=>1,
       :results=>
        [{:author=>"elshaarawy",
          :author_details=>
           {:name=>"",
            :username=>"elshaarawy",
            :avatar_path=>nil,
            :rating=>9.0},
          :content=>
           "very good movie 9.5/10 محمد الشعراوى",
          :created_at=>
           "2016-04-29T18:08:41.892Z",
          :id=>"5723a329c3a3682e720005db",
          :updated_at=>
           "2016-04-29T20:29:23.129Z",
          :url=>
           "https://www.themoviedb.org/review/5723a329c3a3682e720005db"},
         {:author=>"John Chard",
          :author_details=>
           {:name=>"",
            :username=>"John Chard",
            :avatar_path=>
             "/utEXl2EDiXBK6f41wCLsvprvMg4.jpg",
            :rating=>10.0},
          :content=>
           "Some birds aren't meant to be caged. 10/10",
          :created_at=>
           "2016-07-10T00:16:50.561Z",
          :id=>"578193f29251417c28001764",
          :updated_at=>
           "2019-04-28T08:20:10.720Z",
          :url=>
           "https://www.themoviedb.org/review/578193f29251417c28001764"},
         {:author=>"tmdb73913433",
          :author_details=>
           {:name=>"",
            :username=>"tmdb73913433",
            :avatar_path=>nil,
            :rating=>6.0},
          :content=>
           "Make way for the best film ever made people. **Make way.**",
          :created_at=>
           "2017-11-11T15:09:34.114Z",
          :id=>"5a0712aec3a3687914014a4b",
          :updated_at=>
           "2017-11-12T06:47:43.229Z",
          :url=>
           "https://www.themoviedb.org/review/5a0712aec3a3687914014a4b"},
         {:author=>"thommo_nz",
          :author_details=>
           {:name=>"",
            :username=>"thommo_nz",
            :avatar_path=>
             "/https://secure.gravatar.com/avatar/2bd751954d44dbef99755499b602a5f1.jpg",
            :rating=>10.0},
          :content=>
           "There is a reason why this movie is at the top of any popular list your will find.\r\nVery strong performances from lead actors and a story line from the literary brilliance of Stephen King (and no, its not a horror).\r\nSufficient drama and depth to keep you interested and occupied without stupefying your brain. It is the movie that has something for everyone.",
          :created_at=>
           "2018-05-01T05:51:13.756Z",
          :id=>"5ae800510e0a264fa7000c70",
          :updated_at=>
           "2018-05-01T15:11:10.938Z",
          :url=>
           "https://www.themoviedb.org/review/5ae800510e0a264fa7000c70"},
         {:author=>"Andrew Gentry",
          :author_details=>
           {:name=>"Andrew Gentry",
            :username=>"AndrewGentry",
            :avatar_path=>
             "/vVGgWZe3bDdy0fsODYDtrL8J51b.jpg",
            :rating=>nil},
          :content=>
           "It's still puzzling to me why this movie exactly continues to appear in every single best-movies-of-all-time chart. There's a great story, perfect cast, and acting. It really moves me in times when I'm finding myself figuring out things with my annual tax routine reading <a href=\"https://www.buzzfeed.com/davidsmithjd/what-is-form-w-2-and-how-does-it-work-3n31d\">this article</a>, and accidentally catching myself wondering what my life should be if circumstances had changed so drastically. This movie worth a rewatch by all means, but yet, there's no unique vibe or something - there are thousands of other ones as good as this one.",
          :created_at=>
           "2018-10-18T15:08:48.777Z",
          :id=>"5bc8a200c3a36829c8019817",
          :updated_at=>
           "2018-10-18T15:39:39.844Z",
          :url=>
           "https://www.themoviedb.org/review/5bc8a200c3a36829c8019817"},
         {:author=>"Matthew Dixon",
          :author_details=>
           {:name=>"Matthew Dixon",
            :username=>"matthewdixon",
            :avatar_path=>
             "/Af7sJr2dLx38npWMIaDzVmdzwd4.jpg",
            :rating=>nil},
          :content=>
           "I will not say that the film is predictable, because it is not quite so, due to the fact that we only know Andy’s intentions at the end, and during the film, it is important to understand that there was not a hint of it, but let's not forget our guys who so imprudently localized it. I will not be the first, but the word 'redemption' is translated as 'redemption'. I don’t know the reason why our localizers decided to spoil the impression to all Russian-speaking people.",
          :created_at=>
           "2019-07-30T08:25:48.402Z",
          :id=>"5d3fff0c34e1521fb8e86abf",
          :updated_at=>
           "2019-07-31T22:33:05.413Z",
          :url=>
           "https://www.themoviedb.org/review/5d3fff0c34e1521fb8e86abf"}],
       :total_pages=>1,
       :total_results=>6}

    movie_poro = MoviePoro.new(search_data, details_data, cast, reviews_data)

    expected = [{:author=>"elshaarawy",
      :author_details=>
       {:name=>"",
        :username=>"elshaarawy",
        :avatar_path=>nil,
        :rating=>9.0},
      :content=>
       "very good movie 9.5/10 محمد الشعراوى",
      :created_at=>"2016-04-29T18:08:41.892Z",
      :id=>"5723a329c3a3682e720005db",
      :updated_at=>"2016-04-29T20:29:23.129Z",
      :url=>
       "https://www.themoviedb.org/review/5723a329c3a3682e720005db"},
     {:author=>"John Chard",
      :author_details=>
       {:name=>"",
        :username=>"John Chard",
        :avatar_path=>
         "/utEXl2EDiXBK6f41wCLsvprvMg4.jpg",
        :rating=>10.0},
      :content=>
       "Some birds aren't meant to be caged. 10/10",
      :created_at=>"2016-07-10T00:16:50.561Z",
      :id=>"578193f29251417c28001764",
      :updated_at=>"2019-04-28T08:20:10.720Z",
      :url=>
       "https://www.themoviedb.org/review/578193f29251417c28001764"},
     {:author=>"tmdb73913433",
      :author_details=>
       {:name=>"",
        :username=>"tmdb73913433",
        :avatar_path=>nil,
        :rating=>6.0},
      :content=>
       "Make way for the best film ever made people. **Make way.**",
      :created_at=>"2017-11-11T15:09:34.114Z",
      :id=>"5a0712aec3a3687914014a4b",
      :updated_at=>"2017-11-12T06:47:43.229Z",
      :url=>
       "https://www.themoviedb.org/review/5a0712aec3a3687914014a4b"},
     {:author=>"thommo_nz",
      :author_details=>
       {:name=>"",
        :username=>"thommo_nz",
        :avatar_path=>
         "/https://secure.gravatar.com/avatar/2bd751954d44dbef99755499b602a5f1.jpg",
        :rating=>10.0},
      :content=>
       "There is a reason why this movie is at the top of any popular list your will find.\r\nVery strong performances from lead actors and a story line from the literary brilliance of Stephen King (and no, its not a horror).\r\nSufficient drama and depth to keep you interested and occupied without stupefying your brain. It is the movie that has something for everyone.",
      :created_at=>"2018-05-01T05:51:13.756Z",
      :id=>"5ae800510e0a264fa7000c70",
      :updated_at=>"2018-05-01T15:11:10.938Z",
      :url=>
       "https://www.themoviedb.org/review/5ae800510e0a264fa7000c70"},
     {:author=>"Andrew Gentry",
      :author_details=>
       {:name=>"Andrew Gentry",
        :username=>"AndrewGentry",
        :avatar_path=>
         "/vVGgWZe3bDdy0fsODYDtrL8J51b.jpg",
        :rating=>nil},
      :content=>
       "It's still puzzling to me why this movie exactly continues to appear in every single best-movies-of-all-time chart. There's a great story, perfect cast, and acting. It really moves me in times when I'm finding myself figuring out things with my annual tax routine reading <a href=\"https://www.buzzfeed.com/davidsmithjd/what-is-form-w-2-and-how-does-it-work-3n31d\">this article</a>, and accidentally catching myself wondering what my life should be if circumstances had changed so drastically. This movie worth a rewatch by all means, but yet, there's no unique vibe or something - there are thousands of other ones as good as this one.",
      :created_at=>"2018-10-18T15:08:48.777Z",
      :id=>"5bc8a200c3a36829c8019817",
      :updated_at=>"2018-10-18T15:39:39.844Z",
      :url=>
       "https://www.themoviedb.org/review/5bc8a200c3a36829c8019817"},
     {:author=>"Matthew Dixon",
      :author_details=>
       {:name=>"Matthew Dixon",
        :username=>"matthewdixon",
        :avatar_path=>
         "/Af7sJr2dLx38npWMIaDzVmdzwd4.jpg",
        :rating=>nil},
      :content=>
       "I will not say that the film is predictable, because it is not quite so, due to the fact that we only know Andy’s intentions at the end, and during the film, it is important to understand that there was not a hint of it, but let's not forget our guys who so imprudently localized it. I will not be the first, but the word 'redemption' is translated as 'redemption'. I don’t know the reason why our localizers decided to spoil the impression to all Russian-speaking people.",
      :created_at=>"2019-07-30T08:25:48.402Z",
      :id=>"5d3fff0c34e1521fb8e86abf",
      :updated_at=>"2019-07-31T22:33:05.413Z",
      :url=>
       "https://www.themoviedb.org/review/5d3fff0c34e1521fb8e86abf"}]

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
