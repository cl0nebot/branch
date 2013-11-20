require 'spec_helper'

describe "discussion_topics/show" do
  before(:each) do
    @discussion_topic = assign(:discussion_topic, stub_model(DiscussionTopic,
      :user_id => 1,
      :subject => "Subject",
      :text => "MyText",
      :upvotes => 2,
      :downvotes => 3,
      :heat => "9.99",
      :confidence => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
