require 'rails_helper'

RSpec.describe HolidayForm, type: :model do

describe "Associations" do
  it "belongs to employee" do
    assc = described_class.reflect_on_association(:employee)
    expect(assc.macro).to eq :belongs_to
  end
end

end
