class EventsController < ApplicationController
  before_action :find_event, only: %i[edit update destroy]

  def index
    @events = Event.all.page params[:page]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_param)
    if @event.save
      redirect_to events_path, notice: 'Event create'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_param)
      redirect_to events_path, notice: 'Event update'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event delete'
  end

  private

  def event_param
    params.require(:event)
          .permit(:description, :endtime, :link, :location,
                  :organizeremail, :organizertelegram, :starttime, :title)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
