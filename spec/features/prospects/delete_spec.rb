require 'spec_helper'

describe "Deleteing Prospects" do
	let!(:client_list) { ClientList.create(client:"Groot", description: "Sentient tree. A real bruiser.") }
	let!(:prospect) { client_list.prospects.create(name: "STANLY", phone: "8675309") }

	it "is successful" do
		visit_client_list(client_list)
		within "#prospect_#{prospect.id}" do
			click_button "Delete"
		end
		expect(page).to have_content("Prospect was deleted.")
		expect(Prospect.count).to eq(0)
		end
	end
