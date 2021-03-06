class EmployeesController < ApplicationController
  def index
    render json: Employee.all.to_json(include: :user)
  end

  def show

  end

  def create
    employee = Employee.create(employee_params)
    password = SecureRandom.urlsafe_base64(6)
    user = User.create(email: user_params["email"], password: password)
    user.details = employee
    user.save

    render json: JSON.parse(
        user
          .to_json(
            include: {
              details: {
                include: { address: {}}}}))
      .merge!("password": password)
  end

  def destroy
    id = user_params["id"].to_i
    render json: User.find(id).destroy
  end

  def update
    employee = Employee.find(user_params["id"])
    employee.update(employee_params)
    render json: employee.user.to_json(include: :details)
  end

  def update_user
    if current_user.details.nil?
      employee = Employee.create(users_employee_params)
      current_user.details = employee
      current_user.save
    else
      current_user.details.update(users_employee_params)
    end

    render json: current_user
          .to_json(
            include: {
              details: {
                include: { address: {}}}})
  end

  private

  def employee_params
    params.permit(
      :name,
      :surname,
      :phone_number,
      :position,
      :weekly_working_hours,
      address_attributes: [
        :address,
        :city,
        :country,
        :postcode
      ]
    )
  end

  def users_employee_params
    params.permit(
      :name,
      :surname,
      :phone_number,
      :position,
      :weekly_working_hours,
      address_attributes: [
        :address,
        :city,
        :country,
        :postcode
      ]
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
    notes "positions: 'hr', 'worker'"
    param :form, :email, :string, :required, "Email użytkowna"
    param :form, :name, :string, :required, "Imie"
    param :form, :surname, :string, :required, "Nazwisko"
    param :form, :phone_number, :string, :required, "Numer telefonu"
    param :form, :position, :enum, :required, "Pozycja ('hr', 'worker')"
    param :form, :weekly_working_hours, :integer, :required, "Ilość godzin przepracowanych w tygodniu?"
    param :form, "address_attributes[address]", :optional, :string, "Adres?"
    param :form, "address_attributes[city]", :optional, :string, "Miasto"
    param :form, "address_attributes[country]", :optional, :string, "Państwo"
    param :form, "address_attributes[postcode]", :optional, :string, "Kod pocztowy"
  end

  swagger_api :update do
    summary "Nadpisuje dane aktualnego użytkownika"
    notes "positions: 'hr', 'worker'"
    param :path, :id, :integer, :optional, "id employee"
    param :form, :name, :string, :optional, "Imie"
    param :form, :surname, :string, :optional, "Nazwisko"
    param :form, :phone_number, :string, :optional, "Numer telefonu"
    param :form, :position, :enum, :optional, "Pozycja ('hr', 'worker')"
    param :form, :weekly_working_hours, :integer, :optional, "Ilość godzin przepracowanych w tygodniu?"
    param :form, "address_attributes[address]", :optional, :string, "Adres?"
    param :form, "address_attributes[city]", :optional, :string, "Miasto"
    param :form, "address_attributes[country]", :optional, :string, "Państwo"
    param :form, "address_attributes[postcode]", :optional, :string, "Kod pocztowy"
  end

  swagger_api :update_user do
    summary "Nadpisuje dane aktualnego użytkownika"
    notes "positions: 'hr', 'worker'"
    param :form, :name, :string, :optional, "Imie"
    param :form, :surname, :string, :optional, "Nazwisko"
    param :form, :phone_number, :string, :optional, "Numer telefonu"
    param :form, :position, :enum, :optional, "Pozycja ('hr', 'worker')"
    param :form, :weekly_working_hours, :integer, :optional, "Ilość godzin przepracowanych w tygodniu?"
    param :form, "address_attributes[address]", :optional, :string, "Adres?"
    param :form, "address_attributes[city]", :optional, :string, "Miasto"
    param :form, "address_attributes[country]", :optional, :string, "Państwo"
    param :form, "address_attributes[postcode]", :optional, :string, "Kod pocztowy"
  end

  swagger_api :destroy do
    summary "Usuwa użytkownika o danym id"
    param :path, :id, :integer, :required, "Id użytkowanika"
  end

end
