require 'spec_helper'

describe "grades/show" do
  before(:each) do
    @grade = assign(:grade, stub_model(Grade))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
