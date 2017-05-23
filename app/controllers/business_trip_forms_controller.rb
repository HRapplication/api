class BusinessTripFormsController < ApplicationController
  def index
    render json: BusinessTripForm.all
  end

  def create
    render json: current_user.details.business_trip_forms.create(form_params)
  end

  def update
    current_user.details.business_trip_forms.where(id_param).first.update(form_params)
    render json: current_user.details.business_trip_forms.where(id_param).first
  end

  def destroy
    render json: current_user.details.business_trip_forms.where(id_param).first.destroy
  end

  private

  def form_params
    params.permit(
      :company,
      :end_date,
      :start_date,
      :transport
    )
  end

  def id_param
    params.permit(
      :id
    )
  end

  swagger_controller :business_trip, "Business Trip Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end
end
