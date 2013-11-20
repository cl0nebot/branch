require 'spec_helper'

describe "discussion_topics/index" do
  before(:each) do
    assign(:discussion_topics, [
      stub_model(DiscussionTopic,
        :user_id => 1,
        :subject => "Subject",
        :text => "MyText",
        :upvotes => 2,
        :downvotes => 3,
        :heat => "9.99",
        :confidence => "9.99"
      ),
      stub_model(DiscussionTopic,
        :user_id => 1,
        :subject => "Subject",
        :text => "MyText",
        :upvotes => 2,
        :downvotes => 3,
        :heat => "9.99",
        :confidence => "9.99"
      )
    ])
  end

  it "renders a list of discussion_topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
