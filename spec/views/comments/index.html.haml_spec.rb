require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :user_id => 1,
        :parent_id => 2,
        :parent_type => "Parent Type",
        :body => "MyText",
        :upvotes => 3,
        :downvotes => 4,
        :confidence => 1.5,
        :heat => 1.5
      ),
      stub_model(Comment,
        :user_id => 1,
        :parent_id => 2,
        :parent_type => "Parent Type",
        :body => "MyText",
        :upvotes => 3,
        :downvotes => 4,
        :confidence => 1.5,
        :heat => 1.5
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Parent Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
