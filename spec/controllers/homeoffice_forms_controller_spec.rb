require 'rails_helper'

RSpec.describe HomeofficeFormsController, type: :controller do

  before(:example) do
    @user = create(:user)
    @employee = create(:employee)
    @user.details = @employee
    @user.save
    sign_in @user

    @data = {
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "waiting"
    }
  end
  it "returns all waiting homeoffice forms" do
    form = @user.details.homeoffice_forms.create(@data)
    get :index, {status: "waiting"}
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted holiday forms" do
    form = @user.details.homeoffice_forms.create(@data)
    get :index, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "returns all current user homeoffice forms" do
    form = @user.details.homeoffice_forms.create(@data)
    get :all, { status: "waiting" }
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "returns all accepted homeoffice forms" do
    form = @user.details.homeoffice_forms.create(@data)
    get :all, { status: "accepted" }
    output = JSON.parse(response.body)
    expect(output.length).to be(0)
  end

  it "creates homeoffice forms" do
    post :create, @data

    output = JSON.parse(response.body)
    expect(Date.parse(output["start_date"]) == Date.parse(@data[:start_date])).to be(true)
    expect(Date.parse(output["end_date"]) == Date.parse(@data[:end_date])).to be(true)
  end

  it "updates form" do
    form = @user.details.homeoffice_forms.create(@data)
    new_date = "2015-01-02"
    @data[:start_date] = new_date
    @data.merge!(id: form.id)
    patch :update, @data

    output = JSON.parse(response.body)

    expect(Date.parse(output["start_date"]) == Date.parse(new_date)).to be(true)
  end

  it "updates only status form" do
    form = @user.details.homeoffice_forms.create(@data)

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
    form = @user.details.homeoffice_forms.create(@data)
    id = form.id
    delete :destroy, id: id

    expect(HomeofficeForm.where(id: id).count).to be(0)
  end


end
