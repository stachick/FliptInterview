require 'spec_helper'

describe "Editing Prospects" do
	let!(:client_list) { ClientList.create(client:"Groot", description: "Sentient tree. A real bruiser.") }
	let!(:prospect) { client_list.prospects.create(name: "STANLY", phone: "8675309") }

	it "is successful with valid content" do
		visit_client_list(client_list)
		within("#prospect_#{prospect.id}") do
			click_link "Edit"
		end
		fill_in "Name", with: "Stan Lee"
		fill_in "Phone", with: "1234567890"
		click_button "Save"
		expect(page).to have_content ("Saved prospect.")
		prospect.reload
		expect(prospect.name).to eq("Stan Lee")
	end

	it "is unsuccessful with no content" do
		visit_client_list(client_list)
		within("#prospect_#{prospect.id}") do
			click_link "Edit"
		end
		fill_in "Name", with: ""
		fill_in "Phone", with: "1234567890"
		click_button "Save"
		expect(page).to_not have_content ("Saved prospect.")
		expect(page).to have_content("Name can't be blank")
		prospect.reload
		expect(prospect.name).to eq("STANLY")
	end

end