require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  before(:example) do
    @user = create(:user)
    @offer = JobOffer.create('title': 'tellus, imperdiet', 'user_id': @user.id)
  end

  it 'create offer' do
    test_title = "rspec_offer"
    test_content = "rspec_content"

    user = create(:user)
    sign_in @user

    get :create, {
      title: test_title,
      content: test_content
    }

    output = JSON.parse(response.body)

    expect(output["title"]).to eq(test_title)
    expect(output["offers_content"]["content"]).to eq(test_content)
  end
end
