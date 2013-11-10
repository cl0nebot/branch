require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :nickname => "Nickname",
        :middle_name => "Middle Name",
        :summary => "MyText",
        :city => "City",
        :state => "State"
      ),
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :nickname => "Nickname",
        :middle_name => "Middle Name",
        :summary => "MyText",
        :city => "City",
        :state => "State"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
