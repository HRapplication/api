require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  before(:example) do
    @user = create(:user)
  end

  it "gets user schedule for current week" do
    # get :index, {start_date: Date.now - 20, end_date: Date.now}
    # expect(response).to have_http_status(:success)
  end

  it "returns http success" do
    get :show
  end

  it "returns http success" do
    start_hour = Time.new(2000, 1, 1, 14, 35, 0)
    end_hour = Time.new(2000, 1, 1, 14, 45, 0)
    work_date = Date.today

    sign_in @user

    post :create, {
      start_hour: start_hour,
      end_hour: end_hour,
      is_weekend: false,
      work_date: work_date
    }

    output = JSON.parse(response.body)
    ap output

    expect(Time.parse(output["start_hour"])).to eq(start_hour.utc)
  end

  it "returns http success" do
    delete :destroy
  end

end
