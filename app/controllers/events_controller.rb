class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url, notice: 'Successfully created an event'
    else
      render :new
    end
  end
  
  def index
    @events = policy_scope(Event)
  end
  
  def edit
    @event = Event.find(params[:id])
    authorize @event
  end
  
  def update
    @event = Event.find(params[:id])
    authorize @event    
    
    if @event.update(event_params)
      redirect_to event_url(@event), notice: 'Event successfully updated'
    else
      render :edit
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path, notice: 'Event removed'
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :starting_date)
    end
end
