require 'spec_helper'

describe "amendments/edit" do
  before(:each) do
    @amendment = assign(:amendment, stub_model(Amendment,
      :user_id => 1,
      :proposal_id => 1,
      :subject => "MyString",
      :body => "MyText",
      :upvotes => 1,
      :downvotes => 1,
      :confidence => 1.5,
      :heat => 1.5
    ))
  end

  it "renders the edit amendment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", amendment_path(@amendment), "post" do
      assert_select "input#amendment_user_id[name=?]", "amendment[user_id]"
      assert_select "input#amendment_proposal_id[name=?]", "amendment[proposal_id]"
      assert_select "input#amendment_subject[name=?]", "amendment[subject]"
      assert_select "textarea#amendment_body[name=?]", "amendment[body]"
      assert_select "input#amendment_upvotes[name=?]", "amendment[upvotes]"
      assert_select "input#amendment_downvotes[name=?]", "amendment[downvotes]"
      assert_select "input#amendment_confidence[name=?]", "amendment[confidence]"
      assert_select "input#amendment_heat[name=?]", "amendment[heat]"
    end
  end
end
