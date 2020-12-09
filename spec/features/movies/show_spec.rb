require 'rails_helper'

describe 'movie show page' do
  before :each do
    nick = User.create(name: 'Nick', email: 'nick@nick.com', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nick)
  end

  it 'viewing party button exists', :vcr do
    visit "/movies/761053"
    click_button('Create Viewing Party for Movie')
    expect(current_path).to eq('/events/new')
  end

  it 'user sees movie info', :vcr do
    visit "/movies/278"
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Runtime: 2 hr 22 min")
    expect(page).to have_content("Genre(s): Drama, Crime")
    expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
  end

  it "sad path descriptive messages", :vcr do
    visit "/movies/761053"
    expect(page).to have_content("Runtime: Runtime information unavailable.")
    expect(page).to have_content("Genre(s): No genres found.")
    expect(page).to have_content("Cast: Cast information unavailable.")
  end

  it 'user sees cast members', :vcr do
    visit "/movies/278"
    within '.cast-0' do
      expect(page).to have_content("Tim Robbins / Andy Dufresne")
    end
    expect(page).to have_css('.cast-9')
    expect(page).not_to have_css('.cast-10')
  end

  it "user sees reviews", :vcr do
    visit "/movies/278"
    expect(page).to have_content('6 Reviews')
    within '.review-result-0' do
      expect(page).to have_content("very good movie")
      expect(page).to have_content("elshaarawy")
    end
  end
end
