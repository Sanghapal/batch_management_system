require 'spec_helper'

describe "grades_students/new" do
  before(:each) do
    assign(:grades_student, stub_model(GradesStudent).as_new_record)
  end

  it "renders new grades_student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grades_students_path, "post" do
    end
  end
end
