require 'spec_helper'

describe "grades/new" do
  before(:each) do
    assign(:grade, stub_model(Grade).as_new_record)
  end

  it "renders new grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grades_path, "post" do
    end
  end
end
