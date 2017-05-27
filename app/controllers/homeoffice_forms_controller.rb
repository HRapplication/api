class HomeofficeFormsController < ApplicationController

  def index
    render json: HomeofficeForm.all
  end

  def create
    render json: current_user.details.homeoffice_forms.create(form_params)
  end

  def update
    current_user.details.homeoffice_forms.where(id_param).first.update(form_params)
    render json: current_user.details.homeoffice_forms.where(id_param).first
  end

  def destroy
    render json: current_user.details.homeoffice_forms.where(id_param).first.destroy
  end

  def all
    render json: current_user.details.homeoffice_forms
  end

  def pdf_template
    id = params.permit(:homeoffice_form_id)["homeoffice_form_id"]
    @form_data = HomeofficeForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "homeoffice_form.pdf",
                :template => 'homeoffice_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
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

  swagger_controller :homeoffice, "Homeoffice Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
  end

  swagger_api :all do
    summary "Zwraca wszystkie formularze danego usera"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
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
    param :path, :homeoffice_form_id, :integer, :required, "Id formularza"
  end
end
