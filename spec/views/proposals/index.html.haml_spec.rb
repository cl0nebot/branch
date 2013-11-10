require 'spec_helper'

describe "proposals/index" do
  before(:each) do
    assign(:proposals, [
      stub_model(Proposal,
        :subject => "Subject",
        :body => "MyText",
        :user_id => 1,
        :upvotes => 2,
        :downvotes => 3,
        :confidence => 1.5,
        :heat => 1.5
      ),
      stub_model(Proposal,
        :subject => "Subject",
        :body => "MyText",
        :user_id => 1,
        :upvotes => 2,
        :downvotes => 3,
        :confidence => 1.5,
        :heat => 1.5
      )
    ])
  end

  it "renders a list of proposals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
