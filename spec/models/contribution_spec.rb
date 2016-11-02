require 'rails_helper'

RSpec.describe Contribution, type: :model do
  it {
    cm = Contribution.new

    expect(cm).to belong_to(:user)
    expect(cm).to belong_to(:content)
  }
end
