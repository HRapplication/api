require 'rails_helper'

RSpec.describe User, type: :model do

subject { 
    described_class.new(email: "pawel.zyb@gmail.com", encrypted_password: "$2a$10$BMsL49OutEb96exXWZRUPus1/87K7W/eqvnQ9EvqQxCaqXGTgYpQC", employee_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a encrypted_password" do
    subject.encrypted_password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a employee_id" do
    subject.employee_id = nil
    expect(subject).to_not be_valid
  end
end

describe "Associations" do
  it "has many events" do
    assc = described_class.reflect_on_association(:events)
    expect(assc.macro).to eq :has_many
  end

  it "has many job offers" do
    assc = described_class.reflect_on_association(:job_offers)
    expect(assc.macro).to eq :has_many
  end
end

end
