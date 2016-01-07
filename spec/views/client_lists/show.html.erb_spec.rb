require 'spec_helper'

describe "client_lists/show" do
  before(:each) do
    @client_list = assign(:client_list, stub_model(ClientList,
      :client => "Client",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client/)
    rendered.should match(/MyText/)
  end
end
