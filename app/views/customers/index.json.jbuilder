json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :address, :state, :country
  json.url customer_url(customer, format: :json)
end
