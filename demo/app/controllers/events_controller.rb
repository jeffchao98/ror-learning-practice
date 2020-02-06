class EventsController < ApplicationController
    before_action :set_event, :only => [ :show, :edit, :update, :destroy]
    def index
        @events = Event.all
    end
    def new
        @event = Event.new
    end
    def create
        flash[:notice] = "event was successfully created"
        @event = Event.new(event_params)
        if @event.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    def show
    end
    def edit
    end
    def update
        flash[:notice] = "event was successfully updated"
        if @event.update(event_params)
            redirect_to event_url(@event)
        else
            render :action => :edit
        end
    end
    def destroy
        flash[:alert] = "event was successfully deleted"
        @event.destroy
        redirect_to events_url
    end

    def index
        @events = Event.page(params[:page]).per(5)
    end
    
    private
      
    def event_params
        params.require(:event).permit(:name, :description)
    end
    def set_event
        @event = Event.find(params[:id])
    end
end
