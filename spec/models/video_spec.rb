require 'rails_helper'
require "active_record/acts_as/matchers"

RSpec.describe Video, type: :model do
  it { is_expected.to act_as(Content) }

  it "is valid with valid attributes" do
    video = FactoryGirl.create(:video)
    expect(video).to be_valid
  end
end
