require 'spec_helper'

describe "Deleting client lists" do
	let!(:client_list) { ClientList.create(client: "STARLORD", description: "Total bum. Useless in every way") }

	it "is successful when clicking the destroy button" do
		visit "/client_lists"
		within "#client_list_#{client_list.id}" do
			click_button "Destroy"
		end
		expect(page).to_not have_content(client_list.client)
		expect(ClientList.count).to eq(0)
	end
end