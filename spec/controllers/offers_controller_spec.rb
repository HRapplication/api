require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  before(:example) do
    @user = create(:user)
    @offer = @user.job_offers.create(
      title: "title1",
      offers_content_attributes: {
        content: "param1"
        }
      )
  end
  it 'shows offer' do
    sign_in @user

    get :show, {
      id: @offer.id
    }

    output = JSON.parse(response.body)

    expect(output["title"]).to eq(@offer.title)
    expect(output["offers_content"]["content"]).to eq(@offer.offers_content.content)
  end

  it 'create offer' do
    test_title = "rspec_offer"
    test_content = "rspec_content"

    sign_in @user

    post :create, {
      title: test_title,
      content: test_content
    }

    output = JSON.parse(response.body)

    expect(output["title"]).to eq(test_title)
    expect(output["offers_content"]["content"]).to eq(test_content)
  end

  it 'removes offer' do
    sign_in @user
    id = @offer.id

    delete :destroy, {
      id: id
    }

    output = JSON.parse(response.body)

    expect(output["id"]).to eq(id)
    expect(JobOffer.where(id: id).count).to eq(0)
  end
end
