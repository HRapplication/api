class SchedulesController < ApplicationController

  def index
    render json: current_user.schedules
      .where('work_date >= ? AND work_date <= ?', schedules_params["start_date"], schedules_params["end_date"])
  end

  def show
    render json: current_user.schedules.where(id_param).first
  end

  def create
    render json: current_user.schedules.create({
      start_hour: Time.parse(schedule_params["start_hour"]).utc,
      end_hour: Time.parse(schedule_params["end_hour"]).utc,
      is_weekend: schedule_params["is_weekend"],
      work_date: Date.parse(schedule_params["work_date"])
    })
  end

  def destroy
    render json: current_user.schedules.where(id_param).first.destroy
  end

  private

  def schedule_params
    params.permit(
      :start_hour,
      :end_hour,
      :is_weekend,
      :work_date,
    )
  end

  def schedules_params
    params.permit(
      :start_date,
      :end_date
    )
  end

  def id_param
    params.permit(
      :id
    )
  end

  swagger_controller :schedules, "Schedule Management"

  swagger_api :index do
    summary "Pokazuje całą zaplanowaną pracę pomiędzy datami"
    notes "godziny są zwracane w strefie UTC"
    param :query, :start_date, :date, :required, "Data początkowa"
    param :query, :end_date, :date, :required, "Data końcowa"
  end

  swagger_api :show do
    summary "Zwraca jedną pozycję z formularza"
    notes "godziny są zwracane w strefie UTC"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end

  swagger_api :create do
    summary "Tworzy pozyjcę na terminarzu"
    notes "godziny są zwracane w strefie UTC"
    param :form, :start_hour, :string, :required, "Czas startu"
    param :form, :end_hour, :string, :required, "Czas zakończenia"
    param :form, :is_weekend, :boolean, :required, "Czy dana pozycja odbywa się w weekend"
    param :form, :work_date, :string, :required, "Data danego dnia"
  end

  swagger_api :destroy do
    summary "Usuwa pozycję z formularza z danym id"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end
end
