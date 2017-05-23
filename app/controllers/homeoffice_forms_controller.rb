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

  private

  def form_params
    params.permit(
      :end_date,
      :start_date
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

  swagger_api :create do
    summary "Dodaje formularz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end
end
