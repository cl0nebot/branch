require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :nickname => "MyString",
      :middle_name => "MyString",
      :summary => "MyText",
      :city => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_first_name[name=?]", "profile[first_name]"
      assert_select "input#profile_last_name[name=?]", "profile[last_name]"
      assert_select "input#profile_nickname[name=?]", "profile[nickname]"
      assert_select "input#profile_middle_name[name=?]", "profile[middle_name]"
      assert_select "textarea#profile_summary[name=?]", "profile[summary]"
      assert_select "input#profile_city[name=?]", "profile[city]"
      assert_select "input#profile_state[name=?]", "profile[state]"
    end
  end
end
