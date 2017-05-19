require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { 
    described_class.new(country: "Polska", city: "Wroclaw", address: "Grunwaldzka 12", postcode: "50-123", employee_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a city" do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a address" do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a postcode" do
    subject.postcode = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a employee_id" do
    subject.employee_id = nil
    expect(subject).to_not be_valid
  end
end

describe "Associations" do
  it "belongs to employee" do
    assc = described_class.reflect_on_association(:employee)
    expect(assc.macro).to eq :belongs_to
  end
end

end
