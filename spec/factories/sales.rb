FactoryGirl.define do
  factory :sale do
    rioexport_contract "MyString"
    suplier_contract "MyString"
    customer_contract "MyString"
    shipping_company "MyString"
    bags_qty 1
    shipping_date "2016-05-04"
    price "9.99"
    product_type "MyString"
    comission_value "MyString"
    decimal "MyString"
    suplier nil
    customer nil
  end
end
