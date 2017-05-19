require 'rails_helper'

RSpec.describe BusinessTripForm, type: :model do

  subject { 
    described_class.new(start_date: DateTime.now, end_date: DateTime.now+1.week, company: "TEstowa", transport: "Samolot", employee_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a company" do
    subject.company = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a transport" do
    subject.transport = nil
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
