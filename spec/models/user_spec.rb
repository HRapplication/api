require 'rails_helper'

RSpec.describe User, type: :model do

describe "Associations" do
  it "has many events" do
    assc = described_class.reflect_on_association(:events)
    expect(assc.macro).to eq :has_many
  end

  it "has many schedules" do
    assc = described_class.reflect_on_association(:schedules)
    expect(assc.macro).to eq :has_many
  end

  it "has many job offers" do
    assc = described_class.reflect_on_association(:job_offers)
    expect(assc.macro).to eq :has_many
  end
end

end
