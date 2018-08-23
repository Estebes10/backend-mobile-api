class EventsController < ApplicationController

  before_action :encuentra_solicitud
  before_action :encuentra_evento, only: [:show]

  # GET /requests/:request_id/events
  def index
    json_response(@solicitud.events)
  end

  # GET /requests/:request_id/events/:id
  def show
    json_response(@evento)
  end

  private

  def encuentra_solicitud
    @solicitud = Request.find_by!(code: params[:code])
  end

  def encuentra_evento
    @evento = @solicitud.events.find_by!(code: params[:event_code]) if @solicitud
  end

end
