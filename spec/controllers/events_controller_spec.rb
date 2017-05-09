require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  before(:example) do
    @user = create(:user)
    sign_in @user
  end

  it "returns all events" do
    get :index
  end

  it "gets simple event" do
    get :show, id: 1
  end

  it "creates an event" do
    example_event = {
      title: "event1",
      content: "content1",
      duedate: "2001-02-03T04:05:06"
    }

    post :create, example_event

    output = JSON.parse(response.body)
    expect(output["title"]).to eq(example_event[:title])
    expect(DateTime.parse(output["duedate"])).to eq(DateTime.new(2001, 2, 3, 4, 5, 6))
    expect(output["events_content"]["content"]).to eq(example_event[:content])
  end

  it "removes an event" do
    delete :destroy, id: 1
  end

end
