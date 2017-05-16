class EmployeesController < ApplicationController
  def index
    render json: Employee.all
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


  swagger_controller :employees, "Employees Management"

  swagger_api :index do
    summary "Zwraca wszystkich pracowników"
  end

  # swagger_api :show do
  #   summary "Zwraca jedną pozycję ofery pracy"
  #   param :path, :id, :integer, :required, "Id danej pozycji"
  # end

  swagger_api :create do
    summary "Tworzy nowego użytkownika i zwraca jego nowe hasło"
    param :form, :email, :string, :required, "Email użytkowna"
    param :form, :name, :string, :required, "Imie"
    param :form, :surname, :string, :required, "Nazwisko"
    param :form, :phone_number, :string, :required, "Numer telefonu"
    param :form, :position, :integer, :required, "Pozycja"
    param :form, :weekly_working_hours, :integer, :required, "Ilość godzin przepracowanych w tygodniu?"
  end

  swagger_api :update do
    summary "Nadpisuje dane aktualnego użytkownika"
    param :path, :id, :integer, :required, "Id użytkowanika"
    param :form, :name, :string, :required, "Imie"
    param :form, :surname, :string, :required, "Nazwisko"
    param :form, :phone_number, :string, :required, "Numer telefonu"
    param :form, :position, :integer, :required, "Pozycja"
    param :form, :weekly_working_hours, :integer, :required, "Ilość godzin przepracowanych w tygodniu?"
  end

  swagger_api :destroy do
    summary "Usuwa użytkownika o danym id"
    param :path, :id, :integer, :required, "Id użytkowanika"
  end

end
