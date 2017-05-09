class EmployeesController < ApplicationController
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
    id = user_params["id"].to_i
    render json: User.find(id).destroy
  end

  def update
    if current_user.id == user_params["id"].to_i
      user = current_user.details.update(employee_params)
      render json: current_user.to_json(include: :details)
    else
      render json: false
    end
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
    params.permit(:id, :email)
  end

end
