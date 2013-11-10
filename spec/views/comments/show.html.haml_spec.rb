require 'spec_helper'

describe "comments/show" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :user_id => 1,
      :parent_id => 2,
      :parent_type => "Parent Type",
      :body => "MyText",
      :upvotes => 3,
      :downvotes => 4,
      :confidence => 1.5,
      :heat => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Parent Type/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
