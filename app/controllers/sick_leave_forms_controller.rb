class SickLeaveFormsController < ApplicationController

  def index
    status = SickLeaveForm.statuses[status_param["status"]]
    render json: SickLeaveForm.where(status: status)
  end

  def create
    render json: current_user.details.sick_leave_forms.create(form_params)
  end

  def update
    current_user.details.sick_leave_forms.where(id_param).first.update(form_params)
    render json: current_user.details.sick_leave_forms.where(id_param).first
  end

  def destroy
    render json: current_user.details.sick_leave_forms.where(id_param).first.destroy
  end

  def all
    render json: current_user.details.sick_leave_forms
  end

  def pdf_template
    id = params.permit(:sick_leave_form_id)["sick_leave_form_id"]
    @form_data = SickLeaveForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "sick_leave_form.pdf",
                :template => 'sick_leave_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
      :care_type,
      :end_date,
      :start_date,
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

  swagger_controller :sick_leave, "Sick Leave Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :all do
    summary "Zwraca wszystkie formularze danego usera"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    notes "cate_types: 'self', 'child'"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    notes "cate_types: 'self', 'child'"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end

  swagger_api :pdf_template do
    summary "pobiera formularz w formacie pdf"
    notes "Trzeba dopisać .pdf co ścieżki"
    param :path, :sick_leave_form_id, :integer, :required, "Id formularza"
  end
end
