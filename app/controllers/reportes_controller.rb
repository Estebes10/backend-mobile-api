class ReportesController < ApplicationController

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
      :folio,
      :user_id,
      :situation_id,
      :place,
      { :attachments => [] }
    )
  end

end
