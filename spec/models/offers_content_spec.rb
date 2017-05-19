require 'rails_helper'

RSpec.describe OffersContent, type: :model do

subject { 
    described_class.new(content: "Tu jest opis stanowiska", job_offer_id: "2") 
}
  
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a job_offer_id" do
    subject.job_offer_id = nil
    expect(subject).to_not be_valid
  end
end

describe "Associations" do
    it "belongs to job offer" do
    assc = described_class.reflect_on_association(:job_offer)
    expect(assc.macro).to eq :belongs_to
  end
end

end
