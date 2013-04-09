require 'spec_helper'

describe "trainers/index" do
  before(:each) do
    assign(:trainers, [
      stub_model(Trainer),
      stub_model(Trainer)
    ])
  end

  it "renders a list of trainers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
