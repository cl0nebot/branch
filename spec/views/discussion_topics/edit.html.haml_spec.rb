require 'spec_helper'

describe "discussion_topics/edit" do
  before(:each) do
    @discussion_topic = assign(:discussion_topic, stub_model(DiscussionTopic,
      :user_id => 1,
      :subject => "MyString",
      :text => "MyText",
      :upvotes => 1,
      :downvotes => 1,
      :heat => "9.99",
      :confidence => "9.99"
    ))
  end

  it "renders the edit discussion_topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", discussion_topic_path(@discussion_topic), "post" do
      assert_select "input#discussion_topic_user_id[name=?]", "discussion_topic[user_id]"
      assert_select "input#discussion_topic_subject[name=?]", "discussion_topic[subject]"
      assert_select "textarea#discussion_topic_text[name=?]", "discussion_topic[text]"
      assert_select "input#discussion_topic_upvotes[name=?]", "discussion_topic[upvotes]"
      assert_select "input#discussion_topic_downvotes[name=?]", "discussion_topic[downvotes]"
      assert_select "input#discussion_topic_heat[name=?]", "discussion_topic[heat]"
      assert_select "input#discussion_topic_confidence[name=?]", "discussion_topic[confidence]"
    end
  end
end
