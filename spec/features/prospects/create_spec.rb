require 'spec_helper'

describe "Adding Prospects" do
	let!(:client_list) { ClientList.create(client:"Groot", description: "Sentient tree. A real bruiser.") }
	
	it "is successful with valid content" do
		visit_client_list(client_list)
		click_link "New Prospect"
		fill_in "Name", with: "Name1"
		fill_in "Phone", with: "Number1"
		click_button "Save"
		expect(page).to have_content("Added prospect")
		within("ul.prospects") do
			expect(page).to have_content("Name1")
			expect(page).to have_content("Number1")
		end
	end

	it "displays an error with no content" do
		visit_client_list(client_list)
		click_link "New Prospect"
		fill_in "Name", with: ""
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("Could not add prospect.")
		end
		expect(page).to have_content("Name can't be blank")
	end

end