require 'spec_helper'

describe "grades_students/edit" do
  before(:each) do
    @grades_student = assign(:grades_student, stub_model(GradesStudent))
  end

  it "renders the edit grades_student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grades_student_path(@grades_student), "post" do
    end
  end
end
