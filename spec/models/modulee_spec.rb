require 'rails_helper'
require "active_record/acts_as/matchers"

RSpec.describe Modulee, type: :model do
  let(:modulee_new) { FactoryGirl.build(:modulee) }

  it { is_expected.to act_as(Content) }

  it "is valid with valid attributes" do
    modulee = FactoryGirl.create(:modulee)
    expect(modulee).to be_valid
  end

  it "is not valid with duplicate attr_1" do
    modulee = FactoryGirl.create(:modulee)
    expect(modulee_new).to be_invalid
  end

end
