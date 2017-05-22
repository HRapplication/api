class UsersController < ApplicationController
  def index
    render json: current_user
      .to_json(
        include: {
          details: {
            include: { address: {}}}})
  end

  swagger_controller :schedules, "User Management"

  swagger_api :index do
    summary "Zwraca dane aktulanie zalogowanego użytkownika"
  end
end
