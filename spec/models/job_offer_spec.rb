require 'rails_helper'

RSpec.describe JobOffer, type: :model do

subject { 
    described_class.new(title: "Pomocnik kucharza", is_available: "1", user_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a is_avaiable" do
    subject.is_available = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end

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
