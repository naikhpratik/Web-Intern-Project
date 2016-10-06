require 'rails_helper'
require "active_record/acts_as/matchers"

RSpec.describe Audio, type: :model do
  it { is_expected.to act_as(Content) }

  it "is valid with valid attributes" do
    audio = FactoryGirl.create(:audio)
    expect(audio).to be_valid
  end
end
