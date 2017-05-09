class EventsController < ApplicationController
  def index
    render json: {response: true}
  end

  def show
    render json: {response: true}
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
    render json: {response: true}
  end

  private

  def title_param
    params.permit(:title)["title"]
  end

  def content_param
    params.permit(:content)["content"]
  end

  def duedate_param
    params.permit(:duedate)["duedate"]
  end
end
