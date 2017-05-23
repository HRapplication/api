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
      holiday_type: "compensation_for_overtime"
    }
  end
  it "returns all sick leave forms" do
    form = @user.details.holiday_forms.create(@data)
    get :index
    output = JSON.parse(response.body)
    expect(output.length).to be(1)
  end

  it "creates sick leave forms" do
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

  it "deletes form" do
    form = @user.details.holiday_forms.create(@data)
    id = form.id
    delete :destroy, id: id

    expect(HolidayForm.where(id: id).count).to be(0)
  end

end
