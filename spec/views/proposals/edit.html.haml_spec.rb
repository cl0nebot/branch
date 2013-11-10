require 'spec_helper'

describe "proposals/edit" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :subject => "MyString",
      :body => "MyText",
      :user_id => 1,
      :upvotes => 1,
      :downvotes => 1,
      :confidence => 1.5,
      :heat => 1.5
    ))
  end

  it "renders the edit proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do
      assert_select "input#proposal_subject[name=?]", "proposal[subject]"
      assert_select "textarea#proposal_body[name=?]", "proposal[body]"
      assert_select "input#proposal_user_id[name=?]", "proposal[user_id]"
      assert_select "input#proposal_upvotes[name=?]", "proposal[upvotes]"
      assert_select "input#proposal_downvotes[name=?]", "proposal[downvotes]"
      assert_select "input#proposal_confidence[name=?]", "proposal[confidence]"
      assert_select "input#proposal_heat[name=?]", "proposal[heat]"
    end
  end
end
