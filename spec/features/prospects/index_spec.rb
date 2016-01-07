require 'spec_helper'

describe "Viewing Prospects" do
	let!(:client_list) { ClientList.create(client:"Groot", description: "Sentient tree. A real bruiser.") }
	
	it "displays the title of the client list" do
		visit_client_list(client_list)
		within("h1") do
			expect(page).to have_content(client_list.client)
		end
	end

	it "displays no items when a client is empty" do
		visit_client_list(client_list)
		expect(page.all("ul.client_list li").size).to eq(0)
	end

	it "displays the prospects when a client has prospects" do
		client_list.prospects.create(name: "Name1", phone: "Number1")
		client_list.prospects.create(name: "Name2", phone: "")
		client_list.prospects.create(name: "Name3", phone: "Number3")

		visit_client_list(client_list)

		expect(page.all("ul.prospects li").size).to eq(3)

		within "ul.prospects" do
			expect(page).to have_content("Name1")
			expect(page).to have_content("Number1")
			expect(page).to have_content("Name2")
			expect(page).to have_content("Name3")
			expect(page).to have_content("Number3")

		end
	end
end 