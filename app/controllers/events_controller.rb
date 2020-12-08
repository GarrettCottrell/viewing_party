class EventsController < ApplicationController

  def new
  end

  def create
    movie = Movie.create(name: params[:movie_title], api_id: params[:api_id])
    event = Event.new(
      date: params[:day],
      start_time: params[:time],
      duration: params[:duration],
      movie_id: movie.id
    )
    if event.save
      UserEvent.create(user_id: current_user.id, event_id: event.id, status: 'Hosting')
      current_user.friends.each do |friend|
        if params[friend.name]
          UserEvent.create(user_id: friend.id, event_id: event.id, status: 'Invited')
        end
      end 
      flash[:success] = 'Your viewing party has been created!'
      redirect_to dashboard_index_path
    else
      flash[:error] = 'Something went wrong, please try again.'
      render :new
    end
  end
end
