require 'rails_helper'

RSpec.describe OffersContent, type: :model do

describe "Associations" do
    it "belongs to job offer" do
    assc = described_class.reflect_on_association(:job_offer)
    expect(assc.macro).to eq :belongs_to
  end
end

end
