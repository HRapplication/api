class SchedulesController < ApplicationController

  def index
  end

  def show
  end

  def create
    render json: Schedule.create({
      start_hour: Time.parse(schedule_params["start_hour"]).utc,
      end_hour: Time.parse(schedule_params["end_hour"]).utc,
      is_weekend: schedule_params["is_weekend"],
      work_date: schedule_params["work_date"]
    })
  end

  def destroy
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
end
