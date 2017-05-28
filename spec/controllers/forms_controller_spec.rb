require 'rails_helper'

RSpec.describe FormsController, type: :controller do

  before(:example) do
    @user = create(:user)
    @employee = create(:employee)
    @user.details = @employee
    @user.save
    sign_in @user

    holiday_form = {
      comment: "comment",
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      holiday_type: "compensation_for_overtime",
      status: "waiting"
    }

    business_trip_form = {
      company: "some company",
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      transport: "some transport",
      status: "waiting"
    }

    homeoffice_form = {
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "waiting"
    }

    sick_leave_form = {
      care_type: 'self',
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "waiting"
    }

    homeoffice_form_accepted = {
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "accepted"
    }

    sick_leave_form_accepted = {
      care_type: 'self',
      end_date: "2015-01-01",
      start_date: "2015-02-01",
      status: "accepted"
    }

    @user.details.sick_leave_forms.create(sick_leave_form)
    @user.details.business_trip_forms.create(business_trip_form)
    @user.details.holiday_forms.create(holiday_form)
    @user.details.homeoffice_forms.create(homeoffice_form)
    @user.details.homeoffice_forms.create(homeoffice_form_accepted)
    @user.details.sick_leave_forms.create(sick_leave_form_accepted)
  end

  it "returns all waiting forms" do
    get :combined, {status: "waiting"}
    output = JSON.parse(response.body)
    expect(output.length).to be(4)
  end

  it "returns all accepted forms" do
    get :combined, {status: "waiting"}
    output = JSON.parse(response.body)
    expect(output.length).to be(4)
  end

  it "returns user all accepted forms " do
    get :user_combined, {status: "waiting"}
    output = JSON.parse(response.body)
    expect(output.length).to be(4)
  end

  it "returns user all accepted forms " do
    get :user_combined, {status: "accepted"}
    output = JSON.parse(response.body)
    expect(output.length).to be(2)
  end
end
