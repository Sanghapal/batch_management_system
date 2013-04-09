require 'spec_helper'

describe "trainers/edit" do
  before(:each) do
    @trainer = assign(:trainer, stub_model(Trainer))
  end

  it "renders the edit trainer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trainer_path(@trainer), "post" do
    end
  end
end
