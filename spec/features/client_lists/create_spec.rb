require 'spec_helper'

describe "Creating client lists" do
	def create_client_list(options={})
		options[:client] ||= "Rocket Racoon"
		options[:description] ||= "Tactical Genius. Heavy weapon specialist."
		
		visit "/client_lists"
		click_link "New Client list"
		expect(page).to have_content("New client_list")

		fill_in "Client", with: options[:client]
		fill_in "Description", with: options[:description] 
		click_button "Create Client list"
	end

	it "redirects to the client list index page on success" do
		create_client_list
		
		click_link "Back"
		expect(page).to have_content("Listing client_lists")
	end

	it "displays an error when the client list has no client" do
		expect(ClientList.count).to eq(0)

		create_client_list client: ""

		expect(page).to have_content("error")
		expect(ClientList.count).to eq(0)

		visit "/client_lists"
		expect(page).to_not have_content("Tactical Genius. Heavy weapon specialist.")
	end
end