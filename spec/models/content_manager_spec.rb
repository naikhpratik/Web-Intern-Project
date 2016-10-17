require 'rails_helper'

RSpec.describe ContentManager, type: :model do
  it {
    cm = ContentManager.new

    expect(cm).to belong_to(:user)
    expect(cm).to belong_to(:content)
  }
end
