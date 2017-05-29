require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  before(:example) do
    @user = create(:user)

    @user.schedules.create({
      start_hour: Time.new(2000, 1, 1, 14, 35, 0).utc,
      end_hour: Time.new(2000, 1, 1, 14, 45, 0).utc,
      is_weekend: false,
      work_date: Date.parse('2016-09-01')
    })
  end

  it "gets user schedule for current week" do
    sign_in @user
    start_date = '2016-08-20'
    end_date = '2016-10-01'
    get :index, {start_date: start_date, end_date: end_date, user_id: @user.id }

    output = JSON.parse(response.body)
    expect(output.length > 0).to be(true)
    expect(Date.parse(output[0]["work_date"]) > Date.parse(start_date)).to be(true)
    expect(Date.parse(output[0]["work_date"]) < Date.parse(end_date)).to be(true)
  end

  it "show one schedule" do
    sign_in @user
    get :show, { id: @user.schedules.first.id, user_id: @user.id }

    output = JSON.parse(response.body)
    expect(output.nil?).to be(false)
    expect(Date.parse(output['work_date']) == Date.parse("2016-09-01")).to be(true)
  end

  it "craete one schedule" do
    start_hour = Time.new(2000, 1, 1, 14, 35, 0)
    end_hour = Time.new(2000, 1, 1, 14, 45, 0)
    work_date = Date.today

    sign_in @user

    post :create, {
      start_hour: start_hour,
      end_hour: end_hour,
      is_weekend: false,
      work_date: work_date,
      user_id: @user.id
    }

    output = JSON.parse(response.body)
    # ap output

    expect(Time.parse(output["start_hour"])).to eq(start_hour.utc)
  end

  it "returns http success" do
    sign_in @user
    delete :destroy, { id: @user.schedules.first.id, user_id: @user.id }

    expect(@user.schedules.count > 0).to be(false)
  end

end
