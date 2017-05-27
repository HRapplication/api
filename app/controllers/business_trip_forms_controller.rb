class BusinessTripFormsController < ApplicationController

  def index
    status = BusinessTripForm.statuses[status_param["status"]]
    render json: BusinessTripForm.where(status: status)
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

  def all
    render json: current_user.details.business_trip_forms
  end

  def pdf_template
    id = params.permit(:business_trip_form_id)["business_trip_form_id"]
    @form_data = BusinessTripForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "business_trip_form.pdf",
                :template => 'business_trip_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
      :company,
      :end_date,
      :start_date,
      :transport,
      :status
    )
  end

  def id_param
    params.permit(
      :id
    )
  end

  def status_param
    params.permit(
      :status
    )
  end

  swagger_controller :business_trip, "Business Trip Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :all do
    summary "Zwraca wszystkie formularze danego usera"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end

  swagger_api :pdf_template do
    summary "pobiera formularz w formacie pdf"
    notes "Trzeba dopisać .pdf co ścieżki"
    param :path, :business_trip_form_id, :integer, :required, "Id formularza"
  end
end
