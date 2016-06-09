json.array!(@sales) do |sale|
  json.extract! sale, :id, :rioexport_contract, :suplier_contract, :customer_contract, :bags_qty, :shipping_date, :price, :product_type, :customer_com_desc, :suplier_com_desc, :suplier_id, :customer_id
  json.url sale_url(sale, format: :json)
end
