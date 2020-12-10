class EventsController < ApplicationController
  def new; end

  def create
    movie = Movie.create(name: params[:movie_title], api_id: params[:api_id])
    event = Event.new(date: params[:day], start_time: params[:time], duration: params[:duration], movie_id: movie.id)
    if invalid_event?(event)
      flash[:error] = 'Something went wrong, please try again.'
      render :new
    else
      event.save
      create_user_events(event)
      redirect_to dashboard_index_path, notice: 'Your viewing party has been created!'
    end
  end

  private

  def invalid_event?(event)
    event.start_time == '' || event.date == '' || event.duration == '' || event.duration < params[:runtime].to_i
  end

  def create_user_events(event)
    UserEvent.create(user_id: current_user.id, event_id: event.id, status: 'Hosting')
    current_user.friends.each do |friend|
      UserEvent.create(user_id: friend.id, event_id: event.id, status: 'Invited') if params[friend.id.to_s]
    end
  end
end
