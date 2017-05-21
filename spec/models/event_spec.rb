require 'rails_helper'

RSpec.describe Event, type: :model do

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
