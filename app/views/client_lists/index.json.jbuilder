json.array!(@client_lists) do |client_list|
  json.extract! client_list, :id, :client, :description
  json.url client_list_url(client_list, format: :json)
end
