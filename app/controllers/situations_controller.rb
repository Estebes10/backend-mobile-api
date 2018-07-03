class SituationsController < ApplicationController

  before_action :encuentra_solicitud
  before_action :encuentra_evento
  before_action :encuentra_situacion, only: [:show]

  # GET /requests/:request_id/events
  def index
    json_response(@evento.situations)
  end

  # GET /requests/:request_id/events/:id
  def show
    json_response(@situacion)
  end

  private

  def encuentra_solicitud
    @solicitud = Request.find(params[:request_id])
  end

  def encuentra_evento
    @evento = @solicitud.events.find_by!(id: params[:event_id]) if @solicitud
  end

  def encuentra_situacion
    @situacion = @evento.situations.find_by!(id: params[:id]) if @evento
  end

end
