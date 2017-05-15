class SchedulesController < ApplicationController

  def index
    render json: current_user.schedules
      .where('work_date > ? AND work_date < ?', schedules_params["start_date"], schedules_params["end_date"])
  end

  def show
    render json: current_user.schedules.where(id_param).first
  end

  def create
    render json: current_user.schedules.create({
      start_hour: Time.parse(schedule_params["start_hour"]).utc,
      end_hour: Time.parse(schedule_params["end_hour"]).utc,
      is_weekend: schedule_params["is_weekend"],
      work_date: schedule_params["work_date"]
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
end
