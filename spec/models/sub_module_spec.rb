require 'rails_helper'
require "active_record/acts_as/matchers"

RSpec.describe SubModule, type: :model do
  let(:sub_module_new) { FactoryGirl.build(:sub_module) }

  it { is_expected.to act_as(Content) }

  it "is valid with valid attributes" do
    sub_module = FactoryGirl.create(:sub_module)
    expect(sub_module).to be_valid
  end
end
