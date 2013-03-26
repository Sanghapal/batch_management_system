require 'spec_helper'

describe "grades_students/index" do
  before(:each) do
    assign(:grades_students, [
      stub_model(GradesStudent),
      stub_model(GradesStudent)
    ])
  end

  it "renders a list of grades_students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
