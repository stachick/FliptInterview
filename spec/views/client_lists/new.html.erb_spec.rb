require 'spec_helper'

describe "client_lists/new" do
  before(:each) do
    assign(:client_list, stub_model(ClientList,
      :client => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new client_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", client_lists_path, "post" do
      assert_select "input#client_list_client[name=?]", "client_list[client]"
      assert_select "textarea#client_list_description[name=?]", "client_list[description]"
    end
  end
end
