require 'spec_helper'

describe "amendments/index" do
  before(:each) do
    assign(:amendments, [
      stub_model(Amendment,
        :user_id => 1,
        :proposal_id => 2,
        :subject => "Subject",
        :body => "MyText",
        :upvotes => 3,
        :downvotes => 4,
        :confidence => 1.5,
        :heat => 1.5
      ),
      stub_model(Amendment,
        :user_id => 1,
        :proposal_id => 2,
        :subject => "Subject",
        :body => "MyText",
        :upvotes => 3,
        :downvotes => 4,
        :confidence => 1.5,
        :heat => 1.5
      )
    ])
  end

  it "renders a list of amendments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
