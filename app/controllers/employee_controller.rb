class EmployeeController < ApplicationController
  def index

  end

  def show

  end

  def create

  end

  def destroy
  end

  private

  def employee_params
    params.permit(
      :name,
      :phone_number,
      :position,
      :surname,
      :weekly_working_hours
    )


  end
end
