require 'spec_helper'

describe "client_lists/edit" do
  before(:each) do
    @client_list = assign(:client_list, stub_model(ClientList,
      :client => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit client_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_list_path(@client_list), "post" do
      assert_select "input#client_list_client[name=?]", "client_list[client]"
      assert_select "textarea#client_list_description[name=?]", "client_list[description]"
    end
  end
end
