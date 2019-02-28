class ReportesController < ApplicationController

  def show
    @reporte = Reporte.find(params[:id])
    json_response(@reporte)
  end

  # POST /todos
  def create
    @reporte = Reporte.create!(reporte_params)
    json_response(@reporte, :created)
  end

  private

  def reporte_params
    # whitelist params
    params.permit(
      :date,
      :hour,
      :description,
      :user_id,
      :situation_id,
      :street,
      :colony,
      :zip_code,
      :house_number,
      :requester_name,
      :requester_lastname,
      images: []
    )
  end

end
