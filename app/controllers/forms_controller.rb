class FormsController < ApplicationController

  def initialize
    @base_class
    @base_method
  end

  def index
    status = @base_class.statuses[status_param["status"]]
    render json: @base_class.where(status: status)
  end

  def create
    render json: current_user.details.send(@base_method).create(form_params)
  end

  def update
    current_user.details.send(@base_method).where(id_param).first.update(form_params)
    render json: current_user.details.send(@base_method).where(id_param).first
  end

  def destroy
    render json: current_user.details.send(@base_method).where(id_param).first.destroy
  end

  def all
    status = @base_class.statuses[status_param["status"]]
    render json: current_user.details.send(@base_method).where(status: status)
  end

  def combined
    forms = []
    status = SickLeaveForm.statuses[status_param["status"]]
    forms += SickLeaveForm.where(status: status).map { |form| form.as_json.merge!(name: 'sick_leave_form') }
    forms += BusinessTripForm.where(status: status).map { |form| form.as_json.merge!(name: 'business_trip_form') }
    forms += HolidayForm.where(status: status).map { |form| form.as_json.merge!(name: 'holiday_form') }
    forms += HomeofficeForm.where(status: status).map { |form| form.as_json.merge!(name: 'homeoffice_form') }

    render json: forms
  end

  def user_combined
    forms = []
    status = SickLeaveForm.statuses[status_param["status"]]
    forms += current_user.details.sick_leave_forms.where(status: status).map { |form| form.as_json.merge!(name: 'sick_leave_form') }
    forms += current_user.details.holiday_forms.where(status: status).map { |form| form.as_json.merge!(name: 'holiday_form') }
    forms += current_user.details.homeoffice_forms.where(status: status).map { |form| form.as_json.merge!(name: 'homeoffice_form') }
    forms += current_user.details.business_trip_forms.where(status: status).map { |form| form.as_json.merge!(name: 'business_trip_form') }

    render json: forms
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

  swagger_controller :sick_leave, "Forms Management"

  swagger_api :combined do
    summary "Zwraca wszystkie formularze o danym statusie"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :user_combined do
    summary "Zwraca wszystkie formularze zalogowanego usera o danym statusie"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

end
