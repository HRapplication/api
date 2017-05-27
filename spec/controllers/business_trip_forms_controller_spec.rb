require 'rails_helper'

RSpec.describe BusinessTripFormsController, type: :controller do

  before(:example) do
    @user = create(:user)
    @employee = create(:employee)
    @user.details = @employee
    @user.save
    sign_in @user

    @data = {
      company: "some company",
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      transport: "some transport",
      status: "waiting"
    }
  end

  it "returns all waiting sick leave forms" do
    form = @user.details.business_trip_forms.create(@data)
    get :index, { status: "waiting" }
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted sick leave forms" do
    form = @user.details.business_trip_forms.create(@data)
    get :index, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "returns all current user sick leave forms" do
    form = @user.details.business_trip_forms.create(@data)
    get :all
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "creates trip leave forms" do
    post :create, @data

    output = JSON.parse(response.body)
    expect(Date.parse(output["start_date"]) == Date.parse(@data[:start_date])).to be(true)
    expect(Date.parse(output["end_date"]) == Date.parse(@data[:end_date])).to be(true)
    expect(output["company"] == @data[:company]).to be(true)
  end

  it "updates form" do
    form = @user.details.business_trip_forms.create(@data)
    @data[:company] = "company1"
    @data.merge!(id: form.id)
    patch :update, @data

    output = JSON.parse(response.body)

    expect(output["company"] == "company1").to be(true)
  end

  it "updates only status form" do
    form = @user.details.business_trip_forms.create(@data)

    new_data = {
      id: form.id,
      status: "accepted"
    }
    patch :update, new_data

    output = JSON.parse(response.body)

    expect(output["company"] == @data[:company]).to be(true)
    expect(output["end_date"] == @data[:end_date]).to be(true)
    expect(output["start_date"] == @data[:start_date]).to be(true)
    expect(output["status"] == "accepted").to be(true)
  end

  it "deletes form" do
    form = @user.details.business_trip_forms.create(@data)
    id = form.id
    delete :destroy, id: id

    expect(BusinessTripForm.where(id: id).count).to be(0)
  end

end
