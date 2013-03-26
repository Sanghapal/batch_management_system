require 'spec_helper'

describe "grades_students/show" do
  before(:each) do
    @grades_student = assign(:grades_student, stub_model(GradesStudent))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
