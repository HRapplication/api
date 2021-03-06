require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  before(:example) do
    @user = create(:user)
    # ap @user
    @user_to_destroy = create(:user)

    @input = {
      email: "bertek@gmail.com",
      name: "bartek",
      surname: "e",
      phone_number: "453213222",
      position: 'hr',
      weekly_working_hours: 4,
      address_attributes: {
        address: 'asd',
        city: 'dsa',
        country: 'sad',
        postcode: '45-500'
      }
    }
  end

  it "creates employee" do
    sign_in @user
    post :create, @input

    output = JSON.parse(response.body)
    # ap output

    expect(output["email"]).to eq(@input[:email])
    expect(output["details"]["name"]).to eq(@input[:name])
    expect(output["details"]["surname"]).to eq(@input[:surname])
    expect(output["details"]["phone_number"]).to eq(@input[:phone_number])
    expect(output["details"]["position"]).to eq(@input[:position ])
    expect(output["details"]["weekly_working_hours"]).to eq(@input[:weekly_working_hours])
    expect(output["details"]["address"]["country"]).to eq(@input[:address_attributes][:country])
  end

  it "destroys employee with id" do
    sign_in @user
    e = Employee.create(@input.except(:email))

    @user.details = e
    @user.save

    id = @user_to_destroy.id
    delete :destroy, id: id

    output = JSON.parse(response.body)

    expect(User.where(id: id).count).to be(0)
  end

  it "updates employee with id" do

    user = create(:user)
    e = Employee.create(@input.except(:email))
    user.details = e
    user.save

    sign_in user

    new_name = "pracownik2"
    new_working_hours = 2
    updated_input = @input
    updated_input[:name] = new_name
    updated_input[:weekly_working_hours] = new_working_hours

    put :update_user, updated_input

    output = JSON.parse(response.body)
    expect(output["details"]["name"]).to eq(new_name)
    expect(output["details"]["weekly_working_hours"]).to eq(@input[:weekly_working_hours])
  end

  it "updates employee with id" do

    user = create(:user)
    e = Employee.create(@input.except(:email))
    user.details = e
    user.save

    sign_in user

    new_name = "pracownik2"
    new_working_hours = 2
    updated_input = @input
    updated_input[:name] = new_name
    updated_input[:weekly_working_hours] = new_working_hours
    updated_input.merge!(id: e.id)

    put :update, updated_input

    output = JSON.parse(response.body)
    expect(output["details"]["name"]).to eq(new_name)
    expect(output["details"]["weekly_working_hours"]).to eq(@input[:weekly_working_hours])
  end

end
