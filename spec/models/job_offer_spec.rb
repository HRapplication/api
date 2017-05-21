require 'rails_helper'

RSpec.describe JobOffer, type: :model do

describe "Associations" do
  it "belongs to user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it "has one offers content" do
    assc = described_class.reflect_on_association(:offers_content)
    expect(assc.macro).to eq :has_one
  end
end

end
