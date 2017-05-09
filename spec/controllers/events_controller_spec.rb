require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  before(:example) do
    @user = create(:user)
    sign_in @user

    e = Employee.create({
      name: "bartek",
      surname: "e",
      phone_number: "453213222",
      position: 1,
      weekly_working_hours: 4
    })

    @user.details = e
    @user.save

    @example_event = {
      title: "event1",
      content: "content1",
      duedate: "2001-02-03T04:05:06"
    }

    @event = @user.events.create(
      title: @example_event[:title],
      events_content_attributes: {
        content: @example_event[:content]
      },
      duedate: @example_event[:duedate]
    )
  end

  it "returns all events" do
    get :index
  end

  it "gets simple event" do
    get :show, id: @event.id
    output = JSON.parse(response.body)
    ap output
  end

  it "creates an event" do
    post :create, @example_event

    output = JSON.parse(response.body)
    expect(output["title"]).to eq(@example_event[:title])
    expect(DateTime.parse(output["duedate"])).to eq(DateTime.new(2001, 2, 3, 4, 5, 6))
    expect(output["events_content"]["content"]).to eq(@example_event[:content])
  end

  it "removes an event" do
    id = @event.id
    delete :destroy, id: id

    expect(Event.where(id: id).count).to be(0)
  end

  it "enlist a user" do
    post :enlist, {event_id: @event.id}

    output = JSON.parse(response.body)
    expect(output["enlisted_for_events"].length).to be(1)
    expect(output["enlisted_for_events"][0]["employee_id"]).to be(@user.details.id)
  end


end
