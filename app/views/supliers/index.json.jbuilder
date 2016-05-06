json.array!(@supliers) do |suplier|
  json.extract! suplier, :id, :name, :email, :address, :state, :country
  json.url suplier_url(suplier, format: :json)
end
