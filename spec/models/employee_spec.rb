require 'rails_helper'

RSpec.describe Employee, type: :model do

subject { 
    described_class.new(name: "Pawel", surname: "Zyblewski", phone_number: "43242342", position: "pracownik", weekly_working_hours: "24", supervisor_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a surname" do
    subject.surname = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone_number" do
    subject.phone_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a position" do
    subject.position = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a weekly_working_hours" do
    subject.weekly_working_hours = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a supervisor_id" do
    subject.supervisor_id = nil
    expect(subject).to_not be_valid
  end
end

describe "Associations" do
  it "has one user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :has_one
  end

  it "has many bisuness trip forms" do
    assc = described_class.reflect_on_association(:business_trip_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has many schedules" do
    assc = described_class.reflect_on_association(:schedules)
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

  it "has many sick leaves forms" do
    assc = described_class.reflect_on_association(:sick_leaves_forms)
    expect(assc.macro).to eq :has_many
  end

  it "has many enlisted for events" do
    assc = described_class.reflect_on_association(:enlisted_for_events)
    expect(assc.macro).to eq :has_many
  end
end

end
