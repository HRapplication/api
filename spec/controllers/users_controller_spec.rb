require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:example) do
    @user = create(:user)
    employee = create(:employee)
    address = create(:address)
    employee.address = address
    employee.save
    @user.details = employee
    @user.save

    sign_in @user
  end

  it "returns http success" do
    get :index

    output = JSON.parse(response.body)
    expect(output.length > 0).to be(true)
    expect(output["details"].nil?).to be(false)
    expect(output["details"]["address"].nil?).to be(false)

  end

end
