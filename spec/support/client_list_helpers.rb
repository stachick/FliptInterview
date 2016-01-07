module ClientListHelpers
	def visit_client_list(list)
		visit "/client_lists"
		within dom_id_for(list) do
			click_link "Client Prospects"
		end
	end
end