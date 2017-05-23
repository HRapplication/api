class SickLeaveFormsController < ApplicationController

  def index
    render json: SickLeaveForm.all
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

  private

  def form_params
    params.permit(
      :care_type,
      :end_date,
      :start_date
    )
  end

  def id_param
    params.permit(
      :id
    )
  end

  swagger_controller :sick_leave, "Sick Leave Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    notes "cate_types: 'self', 'child'"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    notes "cate_types: 'self', 'child'"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end
end
