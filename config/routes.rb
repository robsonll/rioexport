Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :sales
  resources :customers
  resources :supliers
  resources :users

  post '/customer/report' => 'customers#customerReport', :as => :customer_report
  post '/allCustomers/report' => 'customers#allCustomersReport'

  post '/sale/:id/report' => 'sales#saleReport', :as => :sale_report
  post '/allSales/report' => 'sales#allSalesReport'

  post '/user/create' => 'users#create', :as => :user_create

end
