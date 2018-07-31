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
      :street,
      :colony,
      :zip_code,
      :requester_name,
      :requester_lastname,
      { :attachments => [], :people_involved => [:name, :lastname, :phone] }
    )
  end

end
