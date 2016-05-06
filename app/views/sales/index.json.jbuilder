json.array!(@sales) do |sale|
  json.extract! sale, :id, :rioexport_contract, :suplier_contract, :customer_contract, :shipping_company, :bags_qty, :shipping_date, :price, :product_type, :comission_value, :suplier_id, :customer_id
  json.url sale_url(sale, format: :json)
end
