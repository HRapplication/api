class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(id_param).to_json(include: [:events_content, :enlisted_for_events])
  end

  def create
    event = current_user.events.create(
      title: title_param,
      events_content_attributes: {
        content: content_param
      },
      duedate: duedate_param
    )
    render json: event.to_json(include: :events_content)
  end

  def destroy
    render json: Event.find(id_param).destroy
  end

  def enlist
    event = Event.find(event_id_param)
    event.enlisted_for_events.create(employee: current_user.details)
    render json: event.to_json(include: [:events_content, :enlisted_for_events])
  end

  private

  def id_param
    params.permit(:id)["id"]
  end

  def event_id_param
    params.permit(:event_id)["event_id"]
  end

  def title_param
    params.permit(:title)["title"]
  end

  def content_param
    params.permit(:content)["content"]
  end

  def duedate_param
    params.permit(:duedate)["duedate"]
  end


  swagger_controller :events, "Events Management"

  swagger_api :index do
    summary "Zwraca wszystkie wydarzenia"
  end

  swagger_api :show do
    summary "Zwraca jedno wydarzenie z zapisanymi na nie ludźmi"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end

  swagger_api :create do
    summary "Tworzy wydarzenie"
    param :form, :title, :string, :required, "Tytuł wydarzenia"
    param :form, :content, :string, :required, "Opis wydarzenia"
    param :form, :duedate, :date, :required, "Data kiedy wydarzenie się odbędzie"
  end

  swagger_api :destroy do
    summary "Usuwa event"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end

  swagger_api :enlist do
    summary "Zapisuje aktualnego użytkownika na wydarzenie"
    param :path, :event_id, :integer, :required, "Id wydarzenia"
  end
end
