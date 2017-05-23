require 'rails_helper'

RSpec.describe Employee, type: :model do

describe "Associations" do
  it "has one user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :has_one
  end

  it "has many bisuness trip forms" do
    assc = described_class.reflect_on_association(:business_trip_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has many holiday forms" do
    assc = described_class.reflect_on_association(:holiday_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has one address" do
    assc = described_class.reflect_on_association(:address)
    expect(assc.macro).to eq :has_one
  end

  it "has many homeoffice forms" do
    assc = described_class.reflect_on_association(:homeoffice_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has many sick leave forms" do
    assc = described_class.reflect_on_association(:sick_leave_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has many enlisted for events" do
    assc = described_class.reflect_on_association(:enlisted_for_events)
    expect(assc.macro).to eq :has_many
  end
end

end
