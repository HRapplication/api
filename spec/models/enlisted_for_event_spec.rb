require 'rails_helper'

RSpec.describe EnlistedForEvent, type: :model do

subject { 
    described_class.new(event_id: "1", employee_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a event_id" do
    subject.event_id = nil
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

  describe "Associations" do
  it "belongs to event" do
    assc = described_class.reflect_on_association(:event)
    expect(assc.macro).to eq :belongs_to
  end
end
end

end
