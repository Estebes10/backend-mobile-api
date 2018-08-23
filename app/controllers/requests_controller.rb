class RequestsController < ApplicationController

  before_action :encuentra_solicitud, only: [:show]

  # GET /request
  def index
    @solicitudes = Request.all
    json_response(@solicitudes)
  end

  # GET /request/:id
  def show
    json_response(@solicitud)
  end

  private

  def encuentra_solicitud
    @solicitud = Request.find_by!(code: params[:code])
  end

end
