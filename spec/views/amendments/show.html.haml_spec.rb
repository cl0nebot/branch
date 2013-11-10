require 'spec_helper'

describe "amendments/show" do
  before(:each) do
    @amendment = assign(:amendment, stub_model(Amendment,
      :user_id => 1,
      :proposal_id => 2,
      :subject => "Subject",
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
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
