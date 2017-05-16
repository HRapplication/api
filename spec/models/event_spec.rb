require 'rails_helper'

RSpec.describe Event, type: :model do

subject { 
    described_class.new(title: "Szkolenie pracownicze", user_id: "1") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
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

  it "has one events content" do
    assc = described_class.reflect_on_association(:events_content)
    expect(assc.macro).to eq :has_one
  end

  it "has many enlisted for events" do
    assc = described_class.reflect_on_association(:enlisted_for_events)
    expect(assc.macro).to eq :has_many
  end
end

end
