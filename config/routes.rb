Rails.application.routes.draw do
  resources :bus_positions do
    get :bus_detail, on: :collection
    get :freq_positions, on: :collection
  end
  root "bus_positions#bus_detail"
end
