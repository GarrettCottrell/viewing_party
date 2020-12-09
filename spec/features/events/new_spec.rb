require 'rails_helper'

describe 'events new page' do
  before :each do
    @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@garrett)
    @nick = @garrett.friends.create(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')
    @shaun = @garrett.friends.create(name: 'Shaun', email: 'Shaun@example.com', password: '1234', password_confirmation: '1234')
    @ian = @garrett.friends.create(name: 'Ian', email: 'Ian@example.com', password: '1234', password_confirmation: '1234')
  end

  it 'should have form fields', :vcr do

    visit '/movies/278'
    click_button 'Create Viewing Party for Movie'
    expect(current_path).to eq(new_event_path)
    expect(page).to have_content('Shawshank Redemption')
    # expect(page).to have_content(142)
    # save_and_open_page

    expect(page).to_not have_field('Movie Title')
    fill_in 'Duration', with: 160
    fill_in 'Day', with: '12/20/20'
    fill_in 'Time', with: '1:00p'
    check @nick.id
    check @ian.id
    click_button 'Create Party'
    expect(current_path).to eq(dashboard_index_path)
    expect(UserEvent.find_guest_list(Event.last.id)).to eq([@nick, @ian])
  end

  it 'sad path missing fields', :vcr do
    visit '/movies/278'
    click_button 'Create Viewing Party for Movie'
    expect(current_path).to eq(new_event_path)
    expect(page).to have_content('Shawshank Redemption')
    # expect(page).to have_content(142)

    expect(page).to_not have_field('Movie Title')
    fill_in 'Duration', with: 160
    fill_in 'Time', with: '1:00p'
    check @nick.id
    check @ian.id
    click_button 'Create Party'
    expect(current_path).to eq(events_path)
    expect(page).to have_content('Something went wrong, please try again.')
  end
end
