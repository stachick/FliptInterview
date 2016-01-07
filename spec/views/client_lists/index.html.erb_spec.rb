require 'spec_helper'

describe "client_lists/index" do
  before(:each) do
    assign(:client_lists, [
      stub_model(ClientList,
        :client => "Client",
        :description => "MyText"
      ),
      stub_model(ClientList,
        :client => "Client",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of client_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
