class HolidayFormsController < ApplicationController

  def index
    render json: HolidayForm.all
  end

  def create
    render json: current_user.details.holiday_forms.create(form_params)
  end

  def update
    current_user.details.holiday_forms.where(id_param).first.update(form_params)
    render json: current_user.details.holiday_forms.where(id_param).first
  end

  def destroy
    render json: current_user.details.holiday_forms.where(id_param).first.destroy
  end

  private

  def form_params
    params.permit(
      :comment,
      :end_date,
      :start_date,
      :holiday_type
    )
  end

  def id_param
    params.permit(
      :id
    )
  end

  swagger_controller :holiday, "Holiday Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    notes "holiday_types: 'compensation_for_overtime', 'justified_paid_not', 'military', 'parental',
'blood_donation', 'training'"
    param :form, :comment, :string, :required, "Komentarz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :holiday_type, :integer, :required, "Rodzaj wakacji?"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    notes "holiday_types: 'compensation_for_overtime', 'justified_paid_not', 'military', 'parental',
'blood_donation', 'training'"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :comment, :string, :required, "Komentarz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :holiday_type, :integer, :required, "Rodzaj wakacji?"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end
end