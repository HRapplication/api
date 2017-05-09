require 'rails_helper'

RSpec.describe EmployeeController, type: :controller do

  before(:example) do
    @user = create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
    end
  end

  describe "GET #create" do
    it "returns http success" do

      input = {
        email: "bertek@gmail.com",
        name: "bartek",
        surname: "e",
        phone_number: "453213222",
        position: 1,
        weekly_working_hours: 4
      }
      sign_in @user

      post :create, input

      output = JSON.parse(response.body)

      expect(output["email"]).to eq(input[:email])
      expect(output["details"]["name"]).to eq(input[:name])
      expect(output["details"]["surname"]).to eq(input[:surname])
      expect(output["details"]["phone_number"]).to eq(input[:phone_number])
      expect(output["details"]["position"]).to eq(input[:position ])
      expect(output["details"]["weekly_working_hours"]).to eq(input[:weekly_working_hours])
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy
    end
  end

end
