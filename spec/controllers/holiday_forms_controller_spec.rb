require 'rails_helper'

RSpec.describe HolidayFormsController, type: :controller do

  before(:example) do
    @user = create(:user)
    @employee = create(:employee)
    @user.details = @employee
    @user.save
    sign_in @user

    @data = {
      comment: "comment",
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      holiday_type: "compensation_for_overtime",
      status: "waiting"
    }
  end

  it "returns all holiday forms" do
    form = @user.details.holiday_forms.create(@data)
    get :index, {status: "waiting"}
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted holiday forms" do
    form = @user.details.holiday_forms.create(@data)
    get :index, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end


  it "returns all current user holiday forms" do
    form = @user.details.holiday_forms.create(@data)
    get :all, { status: "waiting" }
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted holiday forms" do
    form = @user.details.holiday_forms.create(@data)
    get :all, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "creates holiday forms" do
    post :create, @data

    output = JSON.parse(response.body)
    expect(Date.parse(output["start_date"]) == Date.parse(@data[:start_date])).to be(true)
    expect(Date.parse(output["end_date"]) == Date.parse(@data[:end_date])).to be(true)
    expect(output["comment"] == @data[:comment]).to be(true)
  end

  it "updates form" do
    form = @user.details.holiday_forms.create(@data)
    @data[:comment] = "comment1"
    @data.merge!(id: form.id)
    patch :update, @data

    output = JSON.parse(response.body)

    expect(output["comment"] == "comment1").to be(true)
  end

  it "updates only status form" do
    form = @user.details.holiday_forms.create(@data)

    new_data = {
      id: form.id,
      status: "accepted"
    }
    patch :update, new_data

    output = JSON.parse(response.body)

    expect(output["commpent"] == @data[:commpent]).to be(true)
    expect(output["end_date"] == @data[:end_date]).to be(true)
    expect(output["start_date"] == @data[:start_date]).to be(true)
    expect(output["status"] == "accepted").to be(true)
  end

  it "updates only status form in hr" do
    form = @user.details.holiday_forms.create(@data)

    user2 = create(:user)

    sign_in user2

    new_data = {
      id: form.id,
      status: "accepted"
    }

    patch :update_status, new_data

    output = JSON.parse(response.body)

    expect(output["commpent"] == @data[:commpent]).to be(true)
    expect(output["end_date"] == @data[:end_date]).to be(true)
    expect(output["start_date"] == @data[:start_date]).to be(true)
    expect(output["status"] == "accepted").to be(true)
  end

  it "deletes form" do
    form = @user.details.holiday_forms.create(@data)
    id = form.id
    delete :destroy, id: id

    expect(HolidayForm.where(id: id).count).to be(0)
  end

end
