require 'rails_helper'

RSpec.describe Schedule, type: :model do

subject { 
    described_class.new(work_date: DateTime.now, start_hour: Time.now, end_hour: Time.now, is_weekend: "true", employee_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a work_date" do
    subject.work_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_hour" do
    subject.start_hour = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_hour" do
    subject.end_hour = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a is_weekend" do
    subject.is_weekend = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a employee_id" do
    subject.employee_id = nil
    expect(subject).to_not be_valid
  end
end

describe "Associations" do
  it "belongs to user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end

end
