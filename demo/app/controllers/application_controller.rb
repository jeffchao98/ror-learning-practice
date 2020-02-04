class ApplicationController < ActionController::Base
    def show
        @event = Event.find(params[:id])
        @page_title = @event.name
    end
end
