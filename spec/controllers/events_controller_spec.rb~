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
      duedate: "2001-02-03T04:05:06",
      attending: 3,
      spots: 20,
      place: "dworzec"
    }

    @event = @user.events.create(
      title: @example_event[:title],
      events_content_attributes: {
        content: @example_event[:content]
      },
      duedate: @example_event[:duedate],
      attending: @example_event[:attending],
      spots: @example_event[:spots],
      place: @example_event[:place]
    )
  end

  it "returns all events" do
    get :index
  end

  it "gets simple event" do
    post :enlist, {event_id: @event.id}
    get :show, id: @event.id
    output = JSON.parse(response.body)
    ap output
  end

  it "creates an event" do
    post :create, @example_event

    output = JSON.parse(response.body)
    expect(output["title"]).to eq(@example_event[:title])
    expect(DateTime.parse(output["duedate"])).to eq(DateTime.new(2001, 2, 3, 4, 5, 6))
    expect(output["attending"]).to eq(@example_event[:attending])
    expect(output["spots"]).to eq(@example_event[:spots])
    expect(output["place"]).to eq(@example_event[:place])
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


  it "cant enlist a user twice" do
    post :enlist, {event_id: @event.id}
    post :enlist, {event_id: @event.id}

    output = JSON.parse(response.body)
    expect(output["enlisted_for_events"].length).to be(1)
    expect(output["enlisted_for_events"][0]["employee_id"]).to be(@user.details.id)
  end

  it "unroll a user" do
    event = Event.find(@event.id)
    event.enlisted_for_events.create(employee: @user.details)

    enlisted_before = event.enlisted_for_events.length

    delete :unroll, {event_id: @event.id}

    output = JSON.parse(response.body)
    expect(enlisted_before).to be(1)
    expect(output["enlisted_for_events"].length).to be(0)
  end


end
