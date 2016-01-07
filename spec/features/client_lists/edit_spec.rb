require 'spec_helper'

describe "Editing client lists" do
	let!(:client_list) { ClientList.create(client: "STARLORD", description: "Total bum. Useless in every way") }

	def update_client_list(options={})
		options[:client] ||= "New Client"
		options[:description] ||= "New Description"
		client_list = options[:client_list]

		visit "/client_lists"
		within "#client_list_#{client_list.id}" do
			click_link "Edit"
		end

		fill_in "Client", with: options[:client]
		fill_in	"Description", with: options[:description]
		click_button "Update Client list"
	end

	it "updates a client list with correct information" do
		update_client_list client_list: client_list,
		                   client: "Starlord",
		                   description: "Natural leader. Exceedingly lucky"

		client_list.reload

		expect(page).to have_content("Client list was successfully updated")
		expect(client_list.client).to eq("Starlord")
		expect(client_list.description).to eq("Natural leader. Exceedingly lucky")
	end

	it "displays an error with no client" do
		update_client_list client_list: client_list, client: ""
		client = client_list.client
		client_list.reload
		expect(client_list.client)
		expect(page).to have_content("error")
	end
end
