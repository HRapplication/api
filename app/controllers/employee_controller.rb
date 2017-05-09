class EmployeeController < ApplicationController
  def index

  end

  def show

  end

  def create
    employee = Employee.create(employee_params)
    password = SecureRandom.urlsafe_base64(6)
    user = User.create(email: user_params["email"], password: password)
    user.details = employee
    user.save

    render json: JSON.parse(user.to_json(include: :details)).merge!("password": password)
  end

  def destroy
  end

  private

  def employee_params
    params.permit(
      :name,
      :surname,
      :phone_number,
      :position,
      :weekly_working_hours,
    )
  end
  def user_params
    params.permit(:email)
  end

end
