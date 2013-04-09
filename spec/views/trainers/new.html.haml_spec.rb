require 'spec_helper'

describe "trainers/new" do
  before(:each) do
    assign(:trainer, stub_model(Trainer).as_new_record)
  end

  it "renders new trainer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trainers_path, "post" do
    end
  end
end
