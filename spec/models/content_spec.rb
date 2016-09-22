require 'rails_helper'

RSpec.describe Content, type: :model do

    it { should belong_to(:product) }

  it "is valid with valid attributes" do
    content = Content.new
    expect(content).to be_valid
  end

end
