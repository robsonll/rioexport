Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :sales
  resources :customers
  resources :supliers
  resources :users
  resources :debit_notes
  

  post '/customer/report' => 'customers#customerReport', :as => :customer_report
  post '/allCustomers/report' => 'customers#allCustomersReport'

  post '/sale/:id/report' => 'reports#saleReport', :as => :sale_report
  post '/suplier_sale/:id/report' => 'reports#suplierSaleReport', :as => :suplier_sale_report
  post '/customer_sale/:id/report' => 'reports#customerSaleReport', :as => :customer_sale_report
  post '/allSales/report' => 'reports#allSalesReport'

  post '/suplier/:id/report' => 'supliers#suplierReport', :as => :suplier_report
  post '/allSupliers/report' => 'supliers#allSupliersReport'

  post '/user/create' => 'users#create', :as => :user_create

  get 'debit_note/update_sales' => 'debit_notes#update_sales', :as => :update_sales

end
