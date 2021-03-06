require 'rails_helper'

RSpec.describe SickLeaveFormsController, type: :controller do

  before(:example) do
    @user = create(:user)
    @employee = create(:employee)
    @user.details = @employee
    @user.save
    sign_in @user

    @data = {
      care_type: 'self',
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "waiting"
    }
  end
  it "returns all sick leave forms" do
    form = @user.details.sick_leave_forms.create(@data)
    get :index, { status: "waiting" }
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted sick leave forms" do
    form = @user.details.sick_leave_forms.create(@data)
    get :index, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "returns all current user waiting sick leave forms" do
    form = @user.details.sick_leave_forms.create(@data)
    get :all, { status: "waiting" }
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all current user accepted user sick forms" do
    form = @user.details.sick_leave_forms.create(@data)
    get :all, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "creates sick leave forms" do
    post :create, @data

    output = JSON.parse(response.body)
    expect(Date.parse(output["start_date"]) == Date.parse(@data[:start_date])).to be(true)
    expect(Date.parse(output["end_date"]) == Date.parse(@data[:end_date])).to be(true)
    expect(output["care_type"] == @data[:care_type]).to be(true)
  end

  it "updates form" do
    form = @user.details.sick_leave_forms.create(@data)
    @data[:care_type] = 'child'
    @data.merge!(id: form.id)
    patch :update, @data

    output = JSON.parse(response.body)

    expect(output["care_type"] == 'child').to be(true)
  end

  it "updates only status form" do
    form = @user.details.sick_leave_forms.create(@data)

    new_data = {
      id: form.id,
      status: "accepted"
    }
    patch :update, new_data

    output = JSON.parse(response.body)

    expect(output["end_date"] == @data[:end_date]).to be(true)
    expect(output["start_date"] == @data[:start_date]).to be(true)
    expect(output["status"] == "accepted").to be(true)
  end

  it "deletes form" do
    form = @user.details.sick_leave_forms.create(@data)
    id = form.id
    delete :destroy, id: id

    expect(SickLeaveForm.where(id: id).count).to be(0)
  end

end
