require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user_id => 1,
      :parent_id => 1,
      :parent_type => "MyString",
      :body => "MyText",
      :upvotes => 1,
      :downvotes => 1,
      :confidence => 1.5,
      :heat => 1.5
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "input#comment_parent_id[name=?]", "comment[parent_id]"
      assert_select "input#comment_parent_type[name=?]", "comment[parent_type]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_upvotes[name=?]", "comment[upvotes]"
      assert_select "input#comment_downvotes[name=?]", "comment[downvotes]"
      assert_select "input#comment_confidence[name=?]", "comment[confidence]"
      assert_select "input#comment_heat[name=?]", "comment[heat]"
    end
  end
end
