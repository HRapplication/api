require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  before(:example) do
    @user = create(:user)
    @offer = @user.job_offers.create(
      title: "title1",
      is_available: true,
      offers_content_attributes: {
        content: "param1"
        }
      )
  end

  it 'gets offers' do
    get :index, {is_available: true}

    output = JSON.parse(response.body)

    expect(output.length).to be(1)
    expect(output[0]["is_available"]).to be(true)
  end

  it 'shows offer' do
    get :show, {
      id: @offer.id
    }

    output = JSON.parse(response.body)

    expect(output["title"]).to eq(@offer.title)
    expect(output["offers_content"]["content"]).to eq(@offer.offers_content.content)
  end

  it 'updates offer' do
    sign_in @user
    get :update, {
      id: @offer.id,
      is_available: !@offer.is_available
    }

    output = JSON.parse(response.body)

    expect(output["is_available"]).to eq(!@offer.is_available)
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
