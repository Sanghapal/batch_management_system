require 'spec_helper'

describe "grades/index" do
  before(:each) do
    assign(:grades, [
      stub_model(Grade),
      stub_model(Grade)
    ])
  end

  it "renders a list of grades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
