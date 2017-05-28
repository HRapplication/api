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
end
